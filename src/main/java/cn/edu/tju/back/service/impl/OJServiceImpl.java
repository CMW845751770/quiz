package cn.edu.tju.back.service.impl;

import cn.edu.tju.back.dto.input.PageBackInputDTO;
import cn.edu.tju.back.dto.output.*;
import cn.edu.tju.back.entity.*;
import cn.edu.tju.back.service.OJService;
import cn.edu.tju.security.entity.CurrentUser;
import cn.edu.tju.system.base.ServerResponse;
import cn.edu.tju.system.base.constant.QuizConst;
import cn.edu.tju.system.dto.output.OJRankListDTO;
import cn.edu.tju.system.entity.OJProblem;
import cn.edu.tju.system.entity.OJRecord;
import cn.edu.tju.system.enums.OJProblemDifficultyEnum;
import cn.edu.tju.system.mapper.OJProblemMapper;
import cn.edu.tju.system.mapper.OJRecordMapper;
import com.github.pagehelper.PageHelper;
import javafx.util.Pair;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/14 15:02
 */
@Service
@Slf4j
public class OJServiceImpl implements OJService {

    @Resource
    private OJRecordMapper ojRecordMapper;
    @Resource
    private OJProblemMapper ojProblemMapper;

    @Override
    public ServerResponse myRank() {
        List<OJRankListDTO> ojRankListDTOList = ojRecordMapper.myRank();
        CurrentUser currentUser = CurrentUser.getCurrentUser();
        int rank = 0;
        for (OJRankListDTO ojRankListDTO : ojRankListDTOList) {
            rank++;
            if (ojRankListDTO.getUid().equals(currentUser.getId())) {
                break;
            }
        }
        int easyCount = ojRecordMapper.selectPassCountByUidDifficulty(currentUser.getId(),
                true, OJProblemDifficultyEnum.EASY.getDifficulty());
        int mediumCount = ojRecordMapper.selectPassCountByUidDifficulty(currentUser.getId(),
                true, OJProblemDifficultyEnum.MEDIUM.getDifficulty());
        int hardCount = ojRecordMapper.selectPassCountByUidDifficulty(currentUser.getId(),
                true, OJProblemDifficultyEnum.HARD.getDifficulty());
        MyOJRankInfoOutputDTO rankInfo = new MyOJRankInfoOutputDTO();
        rankInfo.setRank(rank)
                .setOjProblemPassCountDTO(new OJProblemPassCountDTO()
                        .setEasy(easyCount)
                        .setMedium(mediumCount)
                        .setHard(hardCount))
                .setTotalUser(ojRankListDTOList.size());
        return ServerResponse.createBySuccess(rankInfo);
    }

    @Override
    public ServerResponse progress(PageBackInputDTO page) {
        CurrentUser currentUser = CurrentUser.getCurrentUser();
        PageHelper.startPage(page.getPageNum(), page.getPageSize());
        List<OJProgressOutputDTO> progressOutputDTOList = ojRecordMapper.selectProgress(currentUser.getId());
        return ServerResponse.createBySuccess(progressOutputDTOList);
    }

    @Override
    public ServerResponse timeRank(Integer rid) {
        //根据用户id和rid查询出那行记录,判断是通过还是不通过的
        CurrentUser currentUser = CurrentUser.getCurrentUser();
        OJRecord record = ojRecordMapper.selectByPrimaryKeyUid(rid, currentUser.getId());
        if (record == null) {
            return ServerResponse.createByErrorMessage("该用户无此提交记录");
        }
        OJProblem ojProblem = ojProblemMapper.selectByPrimaryKey(record.getPid());
        if (record.getPass()) {
            List<BigDecimal> timeList = ojRecordMapper.selectTime(ojProblem.getId());
            List<Pair<BigDecimal, Double>> timeRankList = new ArrayList<>();
            //分成15份
            BigDecimal minTime = timeList.get(0);
            BigDecimal maxTime = timeList.get(timeList.size() - 1);
            BigDecimal blockPerSize = maxTime.subtract(minTime).divide(new BigDecimal(
                    QuizConst.TIME_RANK_BLOCKS), 3, BigDecimal.ROUND_HALF_UP);
            BigDecimal index = minTime;
            int count = 0;
            int len = timeList.size();
            for (int i = 0; i < len; ) {
                BigDecimal time = timeList.get(i);
                if (time.compareTo(index) >= 0 && time.compareTo(index.add(blockPerSize)) < 0) {
                    count++;
                    i++;
                } else {
                    if (i == len - 1 && time.compareTo(index.add(blockPerSize)) == 0) {
                        count++;
                        i++;
                    }
                    Pair<BigDecimal, Double> pair = new Pair<>(index, castToReservedDouble(count / (double) len, 4));
                    timeRankList.add(pair);
                    index = index.add(blockPerSize);
                    if (time.compareTo(index.add(blockPerSize)) < 0) {
                        count = 1;
                        i++;
                    } else {
                        count = 0;
                    }
                }
            }
            // 0.33 0.36 0.39 0.42 0.45 0.48 0.51 0.54 0.57 0.60 0.63
            //顺便找到自己的时间的索引在哪以及超过百分比
            count = 0;
            for (int i = len - 1; i >= 0; i--) {
                if (timeList.get(i).compareTo(record.getTime()) > 0) {
                    count++;
                } else {
                    break;
                }
            }
            int myIndex = (int) (record.getTime().subtract(minTime).doubleValue() / blockPerSize.doubleValue());
            int myRankIndex = (myIndex >= timeRankList.size()) ? myIndex - 1 : myIndex;
            TimeRankOutputDTO timeRankOutputDTO = new TimeRankOutputDTO();
            timeRankOutputDTO.setMyRankPercent(castToReservedDouble(count / (double) len))
                    .setMyTime(castToReservedDouble(record.getTime(), 3))
                    .setPass(true)
                    .setTimeRankList(timeRankList)
                    .setTitle(ojProblem.getTitle())
                    .setPassTestExampleCount(record.getPassTestExample())
                    .setTotalTestExampleCount(record.getTotalTestExample())
                    .setSubmitDate(record.getCreateTime())
                    .setMyRankIndex(myRankIndex);
            return ServerResponse.createBySuccess(timeRankOutputDTO);
        } else {
            //查询出错误信息
            ErrorInfoOutputDTO errorInfoOutputDTO = new ErrorInfoOutputDTO();
            errorInfoOutputDTO.setInfo(record.getInfo())
                    .setPass(false)
                    .setPassTestExampleCount(record.getPassTestExample())
                    .setTotalTestExampleCount(record.getTotalTestExample())
                    .setSubmitDate(record.getCreateTime())
                    .setTitle(ojProblem.getTitle());
            return ServerResponse.createBySuccess(errorInfoOutputDTO);
        }
    }

    @Override
    public ServerResponse submitRecord(Integer year) {
        //先查询出相关的提交记录
        List<SubmitRecordOutputDTO> list = ojRecordMapper.selectSubmitRecord(year,
                CurrentUser.getCurrentUser().getId());
        Map<Integer, Integer> map = new HashMap<>();
        for (SubmitRecordOutputDTO submitRecordOutputDTO : list) {
            map.computeIfAbsent(submitRecordOutputDTO.getDays(),
                    k -> submitRecordOutputDTO.getSubmitCount());
        }
        return ServerResponse.createBySuccess(generatePlaceholderData(map,year));
    }

    private double castToReservedDouble(double num, int scale) {
        return new BigDecimal(num).setScale(scale, BigDecimal.ROUND_HALF_UP)
                .doubleValue();
    }

    private double castToReservedDouble(double num) {
        return castToReservedDouble(num, 2);
    }

    private BigDecimal castToReservedDouble(BigDecimal num) {
        return castToReservedDouble(num, 2);
    }

    private BigDecimal castToReservedDouble(BigDecimal num, int scale) {
        return num.setScale(scale, BigDecimal.ROUND_HALF_UP);
    }

    private static TimeSpan generatePlaceholderData(Map<Integer, Integer> map, int year) {
        int daysInYear = ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) ? 366 : 365;
        LocalDate firstday = LocalDate.of(year, 1, 1);//一年中的第一天
        int weeksInYear = 0; //当前是一年中的第几周
        int daysInWeek = 0 ; //一周中的第几天
        //用来存week
        List<Week> weeks = new ArrayList<>();
        //用来装day
        List<WeekDay> days = new ArrayList<>();
        for (int i = 0; i < daysInYear; i++) {
            LocalDate time = firstday.plusDays(i);
            days.add(new WeekDay(
                    daysInWeek,
                    new Date(time.getDayOfMonth(), time.getMonthValue() - 1, 0),
                    time.getDayOfMonth() + "-" + (time.getMonthValue() - 1) +"-"+ "0",
                    new Frequency(map.getOrDefault(i, 0))
            ));
            daysInWeek ++ ;
            if (daysInWeek == 7) {
                weeks.add(new Week(weeksInYear,new ArrayList<>(days)));
                days.clear();
                daysInWeek = 0 ;
                weeksInYear ++ ;
            }
        }
        if(daysInWeek != 0){
            weeks.add(new Week(weeksInYear,days));
        }
        return new TimeSpan(
                new Date(0, 0, 0),
                new Date(0, 0, 0),
                weeks
        );
    }


    @Deprecated
    private static TimeSpan generatePlaceholderData(Map<Integer, Integer> map) {
        List<Week> weeks = new ArrayList<>();
        int daysInWeek = 7;
        int weeksInYear = 52;
        int yearCounter = 0; // 第几年
        int monthCounter = 0; // 是第几月
        int weekCounter = 0; //0~3 判断是第几周 用来计算月
        int dayCounter = 0; // 距离月初的天数
        int daysCount = 0; //距离1月1日的天数
        //当前是一年中的第几周
        for (int index = 0; index <= weeksInYear; index++) {
            List<WeekDay> days = new ArrayList<>();
            //一周的第几天
            for (int day = 0; day < daysInWeek; day++) {
                dayCounter++;
                days.add(
                        new WeekDay(day,
                                new Date(dayCounter, monthCounter, yearCounter),
                                dayCounter + "-" + monthCounter + "-" + yearCounter,
                                new Frequency(map.getOrDefault(daysCount, 0))
                        )
                );
                daysCount++;
            }
            if (weekCounter < 3) {
                weekCounter++;
            } else {
                //如果weekCounter = 3
                weekCounter = 0;
                if (monthCounter < 11) {
                    monthCounter++;
                    dayCounter = 0;
                } else {
                    monthCounter = 0;
                    yearCounter++;
                }
            }
            weeks.add(new Week(index, days));
        }
        return new TimeSpan(
                new Date(0, 0, 0),
                new Date(0, 0, 0),
                weeks
        );
    }
}
