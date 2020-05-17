/*
 Navicat Premium Data Transfer

 Source Server         : mysql8.0
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : quiz

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 17/05/2020 10:52:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for quiz_answer
-- ----------------------------
DROP TABLE IF EXISTS `quiz_answer`;
CREATE TABLE `quiz_answer`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户的作答记录',
  `pid` int(10) UNSIGNED NOT NULL COMMENT '哪一道题',
  `correct` tinyint(1) NOT NULL COMMENT '回答是否正确',
  `uid` int(10) UNSIGNED NOT NULL COMMENT '回答的用户',
  `rid` int(10) UNSIGNED NOT NULL COMMENT '那一次测试',
  `create_time` timestamp(0) NOT NULL,
  `update_time` timestamp(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for quiz_oj_problem
-- ----------------------------
DROP TABLE IF EXISTS `quiz_oj_problem`;
CREATE TABLE `quiz_oj_problem`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `timeout` int(11) NOT NULL,
  `type_id` int(255) UNSIGNED NOT NULL,
  `difficulty` tinyint(1) NOT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `update_time` timestamp(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quiz_oj_problem
-- ----------------------------
INSERT INTO `quiz_oj_problem` VALUES (1, '斐波那契数列', '大家都知道斐波那契数列，现在要求输入一个整数n，请你输出斐波那契数列的第n项（从0开始，第0项为0，第1项是1）。\r\nn<=39', 2, 1, 0, '2020-05-12 13:41:53', '2020-05-12 13:41:53');
INSERT INTO `quiz_oj_problem` VALUES (2, 'A+B', '加法练习', 2, 1, 0, '2020-05-12 14:38:10', '2020-05-12 14:38:10');
INSERT INTO `quiz_oj_problem` VALUES (3, '无重复字符的最长子串', '给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。\r\n\r\n        示例 1:\r\n\r\n        输入: \"abcabcbb\"\r\n        输出: 3\r\n        解释: 因为无重复字符的最长子串是 \"abc\"，所以其长度为 3。\r\n        示例 2:\r\n\r\n        输入: \"bbbbb\"\r\n        输出: 1\r\n        解释: 因为无重复字符的最长子串是 \"b\"，所以其长度为 1。\r\n        示例 3:\r\n\r\n        输入: \"pwwkew\"\r\n        输出: 3\r\n        解释: 因为无重复字符的最长子串是 \"wke\"，所以其长度为 3。\r\n             请注意，你的答案必须是 子串 的长度，\"pwke\" 是一个子序列，不是子串。', 3, 1, 1, '2020-05-12 14:37:59', '2020-05-12 14:38:01');
INSERT INTO `quiz_oj_problem` VALUES (4, '快乐数', '编写一个算法来判断一个数 n 是不是快乐数。\r\n\r\n「快乐数」定义为：对于一个正整数，每一次将该数替换为它每个位置上的数字的平方和，然后重复这个过程直到这个数变为 1，也可能是 无限循环 但始终变不到 1。如果 可以变为  1，那么这个数就是快乐数。\r\n\r\n如果 n 是快乐数就返回 True ；不是，则返回 False 。\r\n\r\n \r\n\r\n示例：\r\n\r\n输入：19\r\n输出：true\r\n解释：\r\n12 + 92 = 82\r\n82 + 22 = 68\r\n62 + 82 = 100\r\n12 + 02 + 02 = 1', 3, 1, 0, '2020-05-12 14:46:09', '2020-05-12 14:46:09');
INSERT INTO `quiz_oj_problem` VALUES (5, 'Z 字形变换', '将一个给定字符串根据给定的行数，以从上往下、从左到右进行 Z 字形排列。\r\n\r\n比如输入字符串为 \"LEETCODEISHIRING\" 行数为 3 时，排列如下：\r\n\r\nL   C   I   R\r\nE T O E S I I G\r\nE   D   H   N\r\n之后，你的输出需要从左往右逐行读取，产生出一个新的字符串，比如：\"LCIRETOESIIGEDHN\"。\r\n\r\n请你实现这个将字符串进行指定行数变换的函数：\r\n\r\nstring convert(string s, int numRows);\r\n示例 1:\r\n\r\n输入: s = \"LEETCODEISHIRING\", numRows = 3\r\n输出: \"LCIRETOESIIGEDHN\"\r\n示例 2:\r\n\r\n输入: s = \"LEETCODEISHIRING\", numRows = 4\r\n输出: \"LDREOEIIECIHNTSG\"\r\n解释:\r\n\r\nL     D     R\r\nE   O E   I I\r\nE C   I H   N\r\nT     S     G', 3, 1, 1, '2020-05-12 14:49:55', '2020-05-12 14:49:52');
INSERT INTO `quiz_oj_problem` VALUES (6, '相似度为 K 的字符串', '如果可以通过将 A 中的两个小写字母精确地交换位置 K 次得到与 B 相等的字符串，我们称字符串 A 和 B 的相似度为 K（K 为非负整数）。\r\n\r\n给定两个字母异位词 A 和 B ，返回 A 和 B 的相似度 K 的最小值。\r\n\r\n \r\n\r\n示例 1：\r\n\r\n输入：A = \"ab\", B = \"ba\"\r\n输出：1\r\n示例 2：\r\n\r\n输入：A = \"abc\", B = \"bca\"\r\n输出：2\r\n示例 3：\r\n\r\n输入：A = \"abac\", B = \"baca\"\r\n输出：2\r\n示例 4：\r\n\r\n输入：A = \"aabc\", B = \"abca\"\r\n输出：2\r\n \r\n\r\n提示：\r\n\r\n1 <= A.length == B.length <= 20\r\nA 和 B 只包含集合 {\'a\', \'b\', \'c\', \'d\', \'e\', \'f\'} 中的小写字母。', 3, 1, 2, '2020-05-12 14:55:04', '2020-05-12 14:55:02');
INSERT INTO `quiz_oj_problem` VALUES (7, '有效的括号', '给定一个只包括 \'(\'，\')\'，\'{\'，\'}\'，\'[\'，\']\' 的字符串，判断字符串是否有效。\r\n\r\n有效字符串需满足：\r\n\r\n左括号必须用相同类型的右括号闭合。\r\n左括号必须以正确的顺序闭合。\r\n注意空字符串可被认为是有效字符串。\r\n\r\n示例 1:\r\n\r\n输入: \"()\"\r\n输出: true\r\n示例 2:\r\n\r\n输入: \"()[]{}\"\r\n输出: true\r\n示例 3:\r\n\r\n输入: \"(]\"\r\n输出: false\r\n示例 4:\r\n\r\n输入: \"([)]\"\r\n输出: false\r\n示例 5:\r\n\r\n输入: \"{[]}\"\r\n输出: true', 3, 1, 0, '2020-05-13 21:02:15', '2020-05-13 21:02:14');
INSERT INTO `quiz_oj_problem` VALUES (8, '最长有效括号', '给定一个只包含 \'(\' 和 \')\' 的字符串，找出最长的包含有效括号的子串的长度。\r\n\r\n示例 1:\r\n\r\n输入: \"(()\"\r\n输出: 2\r\n解释: 最长有效括号子串为 \"()\"\r\n示例 2:\r\n\r\n输入: \")()())\"\r\n输出: 4\r\n解释: 最长有效括号子串为 \"()()\"', 3, 1, 2, '2020-05-13 21:05:35', '2020-05-13 21:05:34');
INSERT INTO `quiz_oj_problem` VALUES (9, '基本计算器', '实现一个基本的计算器来计算一个简单的字符串表达式的值。\r\n\r\n字符串表达式可以包含左括号 ( ，右括号 )，加号 + ，减号 -，非负整数和空格  。\r\n\r\n示例 1:\r\n\r\n输入: \"1 + 1\"\r\n输出: 2\r\n示例 2:\r\n\r\n输入: \" 2-1 + 2 \"\r\n输出: 3\r\n示例 3:\r\n\r\n输入: \"(1+(4+5+2)-3)+(6+8)\"\r\n输出: 23\r\n说明：\r\n\r\n你可以假设所给定的表达式都是有效的。\r\n请不要使用内置的库函数 eval。', 3, 1, 2, '2020-05-13 21:08:03', '2020-05-13 21:08:02');
INSERT INTO `quiz_oj_problem` VALUES (10, '去除重复字母', '给你一个仅包含小写字母的字符串，请你去除字符串中重复的字母，使得每个字母只出现一次。需保证返回结果的字典序最小（要求不能打乱其他字符的相对位置）。\r\n\r\n \r\n\r\n示例 1:\r\n\r\n输入: \"bcabc\"\r\n输出: \"abc\"\r\n示例 2:\r\n\r\n输入: \"cbacdcbc\"\r\n输出: \"acdb\"', 3, 1, 2, '2020-05-13 21:11:13', '2020-05-13 21:11:12');
INSERT INTO `quiz_oj_problem` VALUES (11, '最长回文子串\r\n', '给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。\r\n\r\n示例 1：\r\n\r\n输入: \"babad\"\r\n输出: \"bab\"\r\n注意: \"aba\" 也是一个有效答案。\r\n示例 2：\r\n\r\n输入: \"cbbd\"\r\n输出: \"bb\"', 3, 1, 1, '2020-05-13 21:14:08', '2020-05-13 21:14:07');
INSERT INTO `quiz_oj_problem` VALUES (12, '爬楼梯', '假设你正在爬楼梯。需要 n 阶你才能到达楼顶。\r\n\r\n每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？\r\n\r\n注意：给定 n 是一个正整数。\r\n\r\n示例 1：\r\n\r\n输入： 2\r\n输出： 2\r\n解释： 有两种方法可以爬到楼顶。\r\n1.  1 阶 + 1 阶\r\n2.  2 阶\r\n示例 2：\r\n\r\n输入： 3\r\n输出： 3\r\n解释： 有三种方法可以爬到楼顶。\r\n1.  1 阶 + 1 阶 + 1 阶\r\n2.  1 阶 + 2 阶\r\n3.  2 阶 + 1 阶', 3, 1, 0, '2020-05-13 21:17:19', '2020-05-13 21:17:14');
INSERT INTO `quiz_oj_problem` VALUES (13, '计数质数', '统计所有小于非负整数 n 的质数的数量。\r\n\r\n示例:\r\n\r\n输入: 10\r\n输出: 4\r\n解释: 小于 10 的质数一共有 4 个, 它们是 2, 3, 5, 7 。', 2, 1, 0, '2020-05-13 21:21:02', '2020-05-13 21:21:00');

-- ----------------------------
-- Table structure for quiz_oj_record
-- ----------------------------
DROP TABLE IF EXISTS `quiz_oj_record`;
CREATE TABLE `quiz_oj_record`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL,
  `pass` tinyint(255) NOT NULL,
  `time` decimal(10, 5) NOT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `update_time` timestamp(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `info` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for quiz_option
-- ----------------------------
DROP TABLE IF EXISTS `quiz_option`;
CREATE TABLE `quiz_option`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `correct` tinyint(1) NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL,
  `create_time` timestamp(0) NOT NULL,
  `update_time` timestamp(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quiz_option
-- ----------------------------
INSERT INTO `quiz_option` VALUES (1, '“五大”', 0, 1, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (2, '“六大”', 0, 1, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (3, '“七大”', 1, 1, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (4, '“八大”', 0, 1, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (5, '实事求是', 0, 2, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (6, '遵义会议', 0, 2, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (7, '开辟了农村包围城市，武装夺取政权的道路', 1, 2, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (8, '新民主主义革命的理论', 0, 2, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (9, '第一次国内革命战争时期', 0, 3, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (10, '土地革命战争时期', 0, 3, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (11, '抗日战争时期', 1, 3, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (12, '解放战争时期', 0, 3, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (13, '武装斗争', 0, 4, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (14, '统一战线', 0, 4, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (15, '党的建设', 0, 4, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (16, '实事求是', 1, 4, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (17, '1989年', 0, 5, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (18, '1990年', 0, 5, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (19, '1991年', 0, 5, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (20, '1992年', 1, 5, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (21, '结束了“文化大革命”', 0, 6, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (22, '时代主题的转换', 1, 6, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (23, '真理标准问题的大讨论', 0, 6, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (24, '经济全球化', 0, 6, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (25, '科学判断党的历史方位', 1, 7, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (26, '和平与发展的时代主题', 0, 7, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (27, '苏东剧变', 0, 7, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (28, '中国改革开放的大好局面', 0, 7, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (29, '必须坚持以经济建设为中心', 0, 8, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (30, '要聚精会神地抓党的建设', 1, 8, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (31, '必须坚持四项基本原则', 0, 8, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (32, '必须坚持改革开放', 0, 8, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (33, '最广大人民的根本利益', 1, 9, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (34, '无产阶级的根本利益', 0, 9, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (35, '所有人的根本利益', 0, 9, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (36, '中国共产党的根本利益', 0, 9, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (37, '毛泽东', 1, 10, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (38, '刘少奇', 0, 10, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (39, '周恩来', 0, 10, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (40, '邓小平', 0, 10, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (41, '毛泽东', 1, 11, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (42, '邓小平', 0, 11, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (43, '江泽民', 0, 11, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (44, '胡锦涛', 0, 11, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (45, '群众路线', 0, 12, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (46, '组织路线', 0, 12, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (47, '实事求是', 1, 12, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (48, '自力更生', 0, 12, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (49, '实事求是', 1, 13, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (50, '群众路线', 0, 13, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (51, '自力更生', 0, 13, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (52, '改革开放', 0, 13, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (53, '一切为了人民群众、全心全意为人民服务', 0, 14, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (54, '一切向人民群众负责', 0, 14, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (55, '相信群众自己解放自己', 0, 14, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (56, '一切为了群众，一切依靠群众，从群众中来，到群众中去', 1, 14, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (57, '1978年中央工作会议', 1, 15, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (58, '1978年党的十一届三中全会', 0, 15, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (59, '1982年党的十二大', 0, 15, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (60, '1978年全国科学大会开幕式上', 0, 15, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (61, '党的全部理论和工作要体现时代性，把握规律性，富于创造性', 1, 16, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (62, '要看到我国社会主义建设发生的重大变化', 0, 16, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (63, '要看到广大党员干部和人民群众工作、生活条件和社会环境发生的重大变化', 0, 16, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (64, '自觉地把思想认识从那些不合时宜的观念、 做法和体制的束缚中解放出来', 0, 16, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (65, '实事求是', 1, 17, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (66, '与时俱进', 0, 17, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (67, '破除习惯势力和主观主义偏见的束缚', 0, 17, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (68, '求实创新', 0, 17, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (69, '什么是社会主义，怎样建设社会主义', 0, 18, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (70, '解放思想，实事求是', 1, 18, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (71, '坚持共产党的领导，坚持改革开放', 0, 18, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (72, '实事求是', 0, 18, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (73, '封建社会', 0, 19, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (74, '前资本主义社会', 0, 19, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (75, '半殖民地半封建社会', 1, 19, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (76, '资本主义社会', 0, 19, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (77, '帝国主义的侵略', 1, 20, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (78, '中国民族资产阶级的软弱', 0, 20, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (79, '封建主义的腐朽', 0, 20, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (80, '反动势力的联合', 0, 20, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (81, '地主阶级和农民阶级的矛盾', 0, 21, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (82, '帝国主义和中华民族的矛盾', 1, 21, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (83, '资产阶级和无产阶级的矛盾', 0, 21, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (84, '封建主义和人民大众的矛盾', 0, 21, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (85, '新文化运动的兴起', 0, 22, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (86, '五四运动', 1, 22, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (87, '中国共产党的建立', 0, 22, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (88, '北伐战争', 0, 22, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (89, '中共一大', 1, 23, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (90, '中共二大', 0, 23, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (91, '中共三大', 0, 23, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (92, '中共四大', 0, 23, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (93, '帝国主义', 1, 24, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (94, '封建主义', 0, 24, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (95, '官僚资本主义', 0, 24, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (96, '地主豪绅', 0, 24, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (97, '资产阶级领导', 0, 25, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (98, '无产阶级领导', 1, 25, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (99, '农民阶级是主力军', 0, 25, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (100, '帝国主义是主要敌人', 0, 25, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (101, '农民阶级', 1, 26, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (102, '城市小资产阶级', 0, 26, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (103, '民族资产阶级', 0, 26, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (104, '开明士绅', 0, 26, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (105, '武装斗争', 0, 27, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (106, '农民问题', 1, 27, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (107, '党的建设', 0, 27, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (108, '领导权问题', 0, 27, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (109, '从中华人民共和国成立到社会主义改造基本完成', 1, 28, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (110, '从抗日战争胜利到中华人民共和国成立', 0, 28, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (111, '从1953年提出“一化三改”到1956年社会主义改造完成', 0, 28, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (112, '从1953年提出“一化三改”到1958年“大跃进”运动', 0, 28, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (113, '几个革命阶级联合专政', 0, 29, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (114, '无产阶级专政', 1, 29, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (115, '工农与小资产阶级联合专政', 0, 29, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (116, '工农联合专政', 0, 29, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (117, '对个体农业的社会主义改造', 0, 30, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (118, '对资本主义工商业的社会主义改造', 0, 30, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (119, '对个体手工业的社会主义改造', 0, 30, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (120, '实现国家的社会主义工业化', 1, 30, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (121, '资本主义社会', 0, 31, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (122, '社会主义社会', 0, 31, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (123, '新民主主义社会', 1, 31, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (124, '共产主义社会', 0, 31, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (125, '土地改革的完成', 0, 32, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (126, '“三反”、“五反”运动的展开', 0, 32, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (127, '三大改造的完成', 1, 32, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (128, '“一五”计划的制定与实施', 0, 32, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (129, '合作社经济', 0, 33, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (130, '国家资本主义经济', 0, 33, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (131, '国营经济', 1, 33, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (132, '个体经济', 0, 33, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (133, '农业合作化', 0, 34, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (134, '农业机械化', 0, 34, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (135, '逐步实现国家的社会主义工业化', 1, 34, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (136, '手工业合作化', 0, 34, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (137, '改造民族资产阶级', 0, 35, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (138, '改造农民', 0, 35, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (139, '改造小资产阶级', 0, 35, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (140, '逐步实现国家对农业、手工业资本主义工商业的社会主义改造', 1, 35, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (141, '中国共产党即将成为执政党', 1, 36, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (142, '党的工作方式发生了变化', 0, 36, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (143, '全国大陆即将解放', 0, 36, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (144, '中国将由新民主主义社会转变为社会主义社会', 0, 36, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (145, '解放思想，实事求是', 0, 37, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (146, '大力发展生产力', 0, 37, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (147, '一切从社会主义初级阶段出发', 0, 37, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (148, '什么是社会主义，怎样建设社会主义', 1, 37, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (149, '生产资料为社会占有', 0, 38, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (150, '实行按劳分配原则', 0, 38, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (151, '有计划地组织生产', 0, 38, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (152, '解放生产力,发展生产力,消灭剥削,消除两极分化，最终达到共同富裕', 1, 38, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (153, '精髓', 0, 39, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (154, '核心内容', 0, 39, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (155, '思想基础', 0, 39, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (156, '根本点', 1, 39, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (157, '革命', 0, 40, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (158, '阶级斗争', 0, 40, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (159, '改革', 1, 40, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (160, '政治运动', 0, 40, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (161, '生产力高度发达', 1, 41, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (162, '实行按劳分配', 0, 41, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (163, '实行人民民主专政', 0, 41, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (164, '实行社会主义公有制', 0, 41, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (165, '消灭剥削', 0, 42, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (166, '发展生产力', 1, 42, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (167, '以经济建设为中心', 0, 42, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (168, '实现共同富裕', 0, 42, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (169, '调动人民的积极性', 0, 43, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (170, '提高劳动者素质', 0, 43, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (171, '大力发展生产力', 1, 43, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (172, '坚持改革开放', 0, 43, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (173, '无产阶级和资产阶级的矛盾', 0, 44, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (174, '社会主义道路和资本主义道路的矛盾', 0, 44, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (175, '人民日益增长的物质文化需要和落后的社会生产之间的矛盾', 1, 44, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (176, '“左”和右的矛盾', 0, 44, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (177, '发展生产力', 0, 45, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (178, '消灭剥削', 0, 45, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (179, '消除两极分化', 0, 45, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (180, '达到共同富裕', 1, 45, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (181, '马克思', 0, 46, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (182, '列宁', 1, 46, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (183, '毛泽东', 0, 46, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (184, '邓小平', 0, 46, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (185, '生产力水平低，商品经济不发达', 0, 47, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (186, '人口多，底子薄', 0, 47, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (187, '社会主义市场经济体制还不完善', 0, 47, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (188, '处于并将长期处于社会主义初级阶段', 1, 47, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (189, '十一届三中全会邓小平报告中', 0, 48, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (190, '十一届六中全会《关于建国以来党的若干历史问题的决议》中', 0, 48, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (191, '十二大报告中', 1, 48, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (192, '十三大报告中', 0, 48, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (193, '任何国家进入社会主义都必然经历的起始阶段', 0, 49, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (194, '特指我国在生产力落后，商品经济不发达条件下建设社会主义必然要经历的阶段', 1, 49, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (195, '由新民主主义向社会主义过渡的阶段', 0, 49, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (196, '由半殖民地、半封建社会向社会主义社会过渡的阶段', 0, 49, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (197, '过渡性质的', 0, 50, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (198, '新民主主义的', 0, 50, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (199, '社会主义的', 1, 50, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (200, '共产主义的', 0, 50, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (201, '1949年', 0, 51, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (202, '1953年', 0, 51, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (203, '1956年', 1, 51, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (204, '1958年', 0, 51, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (205, '落后的生产力同先进的生产关系的矛盾', 0, 52, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (206, '人民日益增长的物质文化需要同落后的社会生产之间的矛盾', 1, 52, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (207, '商品经济和计划经济的矛盾', 0, 52, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (208, '无产阶级和资产阶级的矛盾', 0, 52, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (209, '分三步走，21世纪中叶基本实现现代化的发展战略', 0, 53, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (210, '分两步走，20世纪末翻两番实现小康社会的发展战略', 1, 53, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (211, '全面建设小康社会的目标', 0, 53, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (212, '实现区域协调发展的目标', 0, 53, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (213, '以经济建设为中心不动摇', 1, 54, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (214, '改革开放不动摇', 0, 54, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (215, '坚持四项基本原则不动摇', 0, 54, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (216, '自力更生不动摇', 0, 54, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (217, '赶超发达资本主义国家的需要', 0, 55, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (218, '赶超发展中国家的需要', 0, 55, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (219, '我国社会主义现代化建设的需要', 1, 55, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (220, '加快发展商品经济的需要', 0, 55, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (221, '长期的基本国策', 1, 56, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (222, '一项特殊政策', 0, 56, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (223, '社会主义初级阶段的一项政策', 0, 56, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (224, '一项权宜之计', 0, 56, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (225, '独立自主、自力更生', 0, 57, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (226, '发展对外贸易，引进资金和先进技术', 1, 57, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (227, '公平合理、互惠互利', 0, 57, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (228, '实行全方位、多层次、宽领域的开放', 0, 57, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (229, '社会主义国家开放', 0, 58, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (230, '资本主义国家开放', 0, 58, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (231, '发展中国家开放', 0, 58, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (232, '全世界开放', 1, 58, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (233, '经济技术开发区', 0, 59, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (234, '沿海开放城市', 0, 59, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (235, '保税区', 0, 59, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (236, '经济特区', 1, 59, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (237, '扫除发展生产力的障碍这个意义上说的', 1, 60, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (238, '对社会各个方面要进行根本性变革的意义上说的', 0, 60, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (239, '根本上改变束缚我国生产力的经济体制意义上说的', 0, 60, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (240, '根本上改变束缚我国生产力的政治体制意义上说的', 0, 60, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (241, '基本制度的变革', 1, 61, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (242, '社会主义政治、经济运行方式的变革', 0, 61, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (243, '社会主义制度的自我完善和发展', 0, 61, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (244, '社会主义原有体制的修补', 0, 61, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (245, '社会主义国家的立国之本', 0, 62, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (246, '社会主义建设的中心', 0, 62, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (247, '社会主义国家的富民之路', 1, 62, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (248, '执政党建设的重要内容', 0, 62, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (249, '目的', 1, 63, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (250, '动力', 0, 63, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (251, '基础', 0, 63, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (252, '条件', 0, 63, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (253, '单纯的公有制', 0, 64, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (254, '公有制为主体、多种所有制经济共同发展', 1, 64, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (255, '多种所有制经济共同发展', 0, 64, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (256, '公有制为主、其它所有制经济为次', 0, 64, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (257, '计划经济为主，市场调节为辅', 0, 65, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (258, '在公有制基础上有计划的商品经济', 1, 65, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (259, '计划与市场内在统一的体制', 0, 65, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (260, '国家调节市场，市场引导企业', 0, 65, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (261, '计划和市场都属于社会基本制度的范畴', 1, 66, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (262, '计划和市场都是资源配置的方式', 0, 66, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (263, '计划和市场不是社会主义与资本主义的本质区别', 0, 66, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (264, '社会主义制度下也可以运行市场经济', 0, 66, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (265, '陈云', 0, 67, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (266, '邓小平', 0, 67, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (267, '毛泽东', 1, 67, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (268, '刘少奇', 0, 67, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (269, '在理论上普遍把计划经济看作是社会主义区别于资本主义的重要特征', 1, 68, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (270, '国民经济实力十分薄弱，现代工业很少', 0, 68, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (271, '前苏联在计划经济体制下进行的建设取得巨大成就对我国产生很大影响', 0, 68, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (272, '当时我国经济结构简单、社会利益关系相对单纯，计划经济容易运行', 0, 68, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (273, '我国现阶段的社会生产结构', 0, 69, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (274, '现阶段的社会生产方式和所有制结构', 1, 69, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (275, '我国现阶段人民的生活方式', 0, 69, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (276, '我国政府的意志', 0, 69, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (277, '2亿元', 0, 70, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (278, '2.5亿元', 1, 70, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (279, '1.5亿元', 0, 70, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (280, '3亿元', 0, 70, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (281, '生产资料公有制', 1, 71, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (282, '全民所有制', 0, 71, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (283, '集体所有制', 0, 71, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (284, '混合所有制', 0, 71, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (285, '生产关系的性质决定的', 0, 72, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (286, '生产关系一定要适合生产力的水平的规律决定的', 1, 72, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (287, '国家的性质决定的', 0, 72, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (288, '各种经济成分的比重决定的', 0, 72, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (289, '国家结构形式', 0, 73, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (290, '国家的政治制度', 0, 73, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (291, '国家政权组织形式', 0, 73, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (292, '国家的阶级性质', 1, 73, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (293, '社会各阶级在国家中的地位', 0, 74, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (294, '国家的权力由哪个或哪些阶级掌握', 0, 74, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (295, '国家的政权组织形式', 1, 74, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (296, '国家的行政管理体制', 0, 74, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (297, '政治协商制度', 0, 75, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (298, '人民民主专政', 1, 75, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (299, '人民代表大会制度', 0, 75, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (300, '民族区域自治制度', 0, 75, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (301, '共产党领导的多党联合专政', 0, 76, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (302, '工农联合专政', 0, 76, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (303, '无产阶级专政', 1, 76, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (304, '社会主义专政', 0, 76, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (305, '社会主义专政', 0, 77, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (306, '人民民主专政', 0, 77, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (307, '人民代表大会制度', 1, 77, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (308, '政治协商制度', 0, 77, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (309, '人民民主专政', 0, 78, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (310, '民族区域自治制度', 0, 78, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (311, '多党合作制度', 0, 78, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (312, '人民代表大会制度', 1, 78, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (313, '无产阶级政党的领导', 0, 79, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (314, '人民当家作主', 1, 79, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (315, '维护社会主义制度', 0, 79, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (316, '依法治国', 0, 79, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (317, '国务院', 0, 80, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (318, '党中央', 0, 80, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (319, '全国人民代表大会', 1, 80, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (320, '人民代表大会', 0, 80, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (321, '共产党执政的一党制', 0, 81, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (322, '共产党和各民主党派联合执政的多党制', 0, 81, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (323, '共产党领导的多党合作和政治协商制度', 1, 81, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (324, '共产党和民主党派轮流执政的两党制', 0, 81, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (325, '爱祖国', 0, 82, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (326, '为人民服务', 1, 82, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (327, '国际主义', 0, 82, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (328, '集体主义', 0, 82, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (329, '与时俱进', 0, 83, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (330, '解放思想', 0, 83, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (331, '艰苦奋斗', 0, 83, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (332, '改革创新', 1, 83, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (333, '坚持用邓小平理论武装全党、教育人民', 0, 84, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (334, '坚持为人民服务、为社会主义服务的方向和双百方针', 0, 84, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (335, '培育“四有”公民', 1, 84, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (336, '建设立足中国现实，继承历史优秀传统，吸取外国文化有益成果的社会主义文化', 0, 84, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (337, '文化是一个内涵十分丰富的范畴', 0, 85, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (338, '广义的文化，是指人类在改造自然和改造社会的过程中所创造的物质财富的总和', 1, 85, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (339, '先进文化是符合人类社会发展方向、体现先进生产力发展要求、代表最广大人民根本利益、反映时代进步潮流的文化', 0, 85, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (340, '当今时代，文化越来越成为民族凝聚力和创造力的重要源泉', 0, 85, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (341, '改革', 0, 86, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (342, '体制机制创新', 0, 86, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (343, '创造生产更多更好适应人民群众需要的精神文化产品', 0, 86, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (344, '发展', 1, 86, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (345, '民族精神和时代精神', 0, 87, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (346, '共同理想', 0, 87, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (347, '马克思主义指导思想', 1, 87, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (348, '社会主义荣辱观', 0, 87, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (349, '健全政策法规', 0, 88, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (350, '树立新的文化发展观', 1, 88, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (351, '体制机制创新', 0, 88, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (352, '政府职能转变', 0, 88, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (353, '马克思主义指导思想', 0, 89, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (354, '中国特色社会主义共同理想', 1, 89, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (355, '民族精神与时代精神', 0, 89, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (356, '社会主义荣辱观', 0, 89, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (357, '发展公益性文化事业', 1, 90, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (358, '发展经营性文化产业', 0, 90, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (359, '培育骨干文化企业', 0, 90, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (360, '吸引文化产业战略投资者', 0, 90, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (361, '社会手段', 0, 91, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (362, '社会计划', 0, 91, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (363, '社会理想', 1, 91, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (364, '社会现实', 0, 91, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (365, '一个没有矛盾的社会形态', 0, 92, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (366, '在人与人之间、人与自然之间都形成和谐的关系', 1, 92, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (367, '人们可以不劳动，随心所欲地享受', 0, 92, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (368, '由社会主义社会与和谐社会构成的共产主义社会', 0, 92, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (369, '十三大', 0, 93, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (370, '十五大', 0, 93, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (371, '十六大', 1, 93, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (372, '十六届六中全会', 0, 93, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (373, '根本任务', 0, 94, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (374, '根本原则', 0, 94, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (375, '本质属性', 1, 94, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (376, '基本要求', 0, 94, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (377, '坚持以人为本', 0, 95, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (378, '坚持科学发展', 1, 95, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (379, '坚持改革开放', 0, 95, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (380, '坚持民主法治', 0, 95, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (381, '坚持以人为本', 0, 96, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (382, '坚持科学发展', 0, 96, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (383, '坚持改革开放', 0, 96, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (384, '坚持正确处理改革发展稳定的关系', 1, 96, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (385, '鼓励自主创业﹑自谋职业', 0, 97, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (386, '加快教育事业发展', 1, 97, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (387, '大力发展生产力，提高人民生活水平', 0, 97, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (388, '加快文化事业发展', 0, 97, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (389, '就业问题', 1, 98, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (390, '人口老龄化问题', 0, 98, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (391, '农民收入问题', 0, 98, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (392, '环境问题', 0, 98, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (393, '坚持教育公益性质', 0, 99, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (394, '合理的收入分配制度', 1, 99, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (395, '千方百计增加就业岗位', 0, 99, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (396, '健全的社会保障体系', 0, 99, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (397, '殖民主义侵略遗留下的问题', 0, 100, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (398, '中美之间的问题', 0, 100, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (399, '中国的内政问题', 1, 100, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (400, '中日之间的问题', 0, 100, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (401, '签订“共同防御条约”', 0, 101, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (402, '提出“一纲四目”', 0, 101, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (403, '美国从台湾撤兵', 1, 101, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (404, '遣返战俘', 0, 101, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (405, '可以保留自己的军队', 1, 102, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (406, '拥有立法权', 0, 102, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (407, '拥有终审权', 0, 102, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (408, '拥有独立司法权', 0, 102, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (409, '四届全国人大三次会议', 0, 103, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (410, '六届全国人大三次会议', 1, 103, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (411, '十届全国人大五次会议', 0, 103, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (412, '十届全国人大四次会议', 0, 103, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (413, '和平统一', 0, 104, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (414, '承认台湾事实上的主权地位', 0, 104, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (415, '坚持一个中国原则', 1, 104, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (416, '一国两制', 0, 104, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (417, '台湾问题开始的', 1, 105, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (418, '香港问题开始的', 0, 105, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (419, '澳门问题开始的', 0, 105, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (420, '西藏问题开始的', 0, 105, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (421, '1999年1月1日', 0, 106, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (422, '1999年5月1日', 0, 106, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (423, '1999年12月20日', 1, 106, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (424, '2000年1月1日', 0, 106, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (425, '《告台湾同胞书》', 0, 107, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (426, '《关于台湾回归祖国，实现和平统一的方针政策》', 0, 107, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (427, '《中国大陆和台湾和平统一的设想》', 0, 107, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (428, '《为促进祖国统一大业的完成而继续奋斗》', 1, 107, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (429, '坚持一个中国原则', 0, 108, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (430, '为两岸同胞谋福祉', 0, 108, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (431, '在“九二共识”基础上进行两岸对话谈判和协商', 1, 108, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (432, '加强经济上的交流合作', 0, 108, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (433, '时代主题', 1, 109, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (434, '领导人意识', 0, 109, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (435, '社会舆论', 0, 109, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (436, '天命、神的启示', 0, 109, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (437, '和平与发展', 0, 110, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (438, '南北问题', 0, 110, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (439, '战争与和平', 1, 110, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (440, '东西问题', 0, 110, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (441, '十二大', 0, 111, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (442, '十三大', 1, 111, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (443, '十四大', 0, 111, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (444, '十五大', 0, 111, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (445, '经济发展', 0, 112, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (446, '科技水平', 0, 112, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (447, '军事力量', 1, 112, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (448, '政治力量', 0, 112, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (449, '毛泽东', 0, 113, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (450, '陈毅', 0, 113, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (451, '刘少奇', 0, 113, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (452, '周恩来', 1, 113, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (453, '独立自主', 1, 114, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (454, '“一边倒”', 0, 114, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (455, '“一条线”', 0, 114, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (456, '“不当头”', 0, 114, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (457, '和平共处', 0, 115, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (458, '平等互利', 0, 115, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (459, '国家主权平等', 1, 115, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (460, '互不侵犯', 0, 115, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (461, '反对霸权主义和强权政治', 0, 116, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (462, '维护世界多样性', 0, 116, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (463, '推动建设持久和平与共同繁荣的和谐世界', 1, 116, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (464, '树立新安全观', 0, 116, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (465, '国家和民族的最高利益', 1, 117, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (466, '世界多样性', 0, 117, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (467, '经济全球化', 0, 117, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (468, '政治多极化', 0, 117, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (469, '农民阶级', 0, 118, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (470, '工人阶级', 1, 118, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (471, '新的社会阶层', 0, 118, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (472, '以上都是', 0, 118, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (473, '农民阶级', 0, 119, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (474, '工人阶级', 1, 119, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (475, '新的社会阶层', 0, 119, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (476, '以上都是', 0, 119, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (477, '先进文化', 0, 120, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (478, '改革开放', 0, 120, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (479, '先进生产力', 1, 120, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (480, '先进生产关系', 0, 120, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (481, '农民', 1, 121, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (482, '工人', 0, 121, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (483, '新的社会阶层', 0, 121, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (484, '知识分子', 0, 121, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (485, '基石', 1, 122, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (486, '保证', 0, 122, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (487, '归宿', 0, 122, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (488, '根本出发点', 0, 122, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (489, '民族团结', 0, 123, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (490, '各民族的共同繁荣', 1, 123, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (491, '民族平等', 0, 123, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (492, '维护祖国统一，反对民族分裂', 0, 123, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (493, '工人阶级的重要组成部分', 0, 124, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (494, '职业和身份不太稳定的劳动者', 0, 124, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (495, '中国特色社会主义事业的建设者', 1, 124, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (496, '资产阶级', 0, 124, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (497, '劳动', 1, 125, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (498, '知识', 0, 125, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (499, '人才', 0, 125, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (500, '创造', 0, 125, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (501, '工人阶级同城市小资产阶级的联盟', 0, 126, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (502, '以工农联盟为基础的工人阶级同农民、小资产阶级的联盟', 1, 126, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (503, '以爱国主义和社会主义为政治基础的团结全体劳动者、社会主义事业的建设者和爱国者的联盟', 0, 126, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (504, '以上都是', 0, 126, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (505, '农民阶级', 0, 127, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (506, '小资产阶级', 0, 127, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (507, '工人阶级', 1, 127, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (508, '民族资产阶级', 0, 127, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (509, '政党中哪个阶级的数量最多', 0, 128, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (510, '政党的理论和纲领究竟代表哪个阶级的利益', 1, 128, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (511, '政党的领袖属于哪个阶级', 0, 128, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (512, '以上都不对', 0, 128, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (513, '工人阶级的先锋队', 0, 129, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (514, '中国民族的先锋队', 0, 129, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (515, '既是工人阶级的先锋队，又是中国民族的先锋队', 0, 129, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (516, '全心全意为人民服务', 1, 129, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (517, '领袖', 0, 130, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (518, '英雄', 0, 130, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (519, '人民群众', 1, 130, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (520, '知识分子', 0, 130, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (521, '注重党的作风建设', 0, 131, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (522, '把思想建设放在党的建设的首位', 0, 131, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (523, '坚持党对人民军队的绝对领导', 0, 131, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (524, '全心全意为人民服务，立党为公，执政为民', 1, 131, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (525, '党群关系', 0, 132, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (526, '民族关系', 0, 132, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (527, '党政关系', 1, 132, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (528, '同其它国家的关系', 0, 132, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (529, '中国最广大人民群众', 1, 133, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (530, '中国共产党党员', 0, 133, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (531, '新的社会阶层', 0, 133, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (532, '工人阶级', 0, 133, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (533, '军队建设', 0, 134, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (534, '反腐倡廉建设', 1, 134, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (535, '农村建设', 0, 134, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (536, '经济建设', 0, 134, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (537, '先进性建设', 0, 135, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (538, '思想建设', 0, 135, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (539, '执政能力建设', 1, 135, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (540, '以上都是', 0, 135, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (541, '正确', 1, 136, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (542, '错误', 0, 136, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (543, '有特效药', 0, 137, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (544, '有疫苗', 0, 137, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (545, '暂时没有', 1, 137, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (546, '与病例共同居住', 0, 138, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (547, '与病例共同学习', 0, 138, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (548, '与病例共同工作', 0, 138, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (549, '与病例共同居住一个区县', 1, 138, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (550, '失去活性', 1, 139, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (551, '死亡', 0, 139, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (552, '增加活性', 0, 139, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (553, '不爱洗手', 0, 140, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (554, '纸巾毛巾擦拭', 0, 140, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (555, '使用肥皂和流动水洗手', 1, 140, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (556, '佩戴手套', 0, 140, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (557, '与病例共同居住、学习、工作的人员', 0, 141, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (558, '诊疗、护理、探视病例时采取了有效防护措施的医护人', 1, 141, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (559, '病例同病室的其他患者及其陪护人员', 0, 141, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (560, '与病例乘坐同一交通工具并有近距离接触人员', 0, 141, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (561, '耐酸碱手套', 0, 142, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (562, '一次性使用医用橡胶检查手套', 1, 142, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (563, '石棉手套', 0, 142, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (564, '绝缘手套', 0, 142, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (565, '正确', 1, 143, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (566, '错误', 0, 143, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (567, '特别重大', 1, 144, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (568, '重大', 0, 144, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (569, '较大', 0, 144, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (570, '一般', 0, 144, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (571, '儿童', 0, 145, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (572, '孕产妇', 0, 145, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (573, '青壮年', 0, 145, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (574, '老年人', 1, 145, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (575, '正确', 1, 146, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (576, '错误', 0, 146, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (577, '甲类', 1, 147, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (578, '乙类', 0, 147, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (579, '丙类', 0, 147, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (580, '500', 0, 148, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (581, '1000', 0, 148, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (582, '1500', 1, 148, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (583, '2000', 0, 148, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (584, '一', 1, 149, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (585, '二', 0, 149, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (586, '三', 0, 149, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (587, '四', 0, 149, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (588, '保持良好的心理状态', 0, 150, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (589, '理性平和的去面对', 0, 150, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (590, '引发焦虑、无理谩骂', 1, 150, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (591, '安慰替代指责与埋怨', 0, 150, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (592, '积极转发扩散', 0, 151, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (593, '不信谣，不传谣，等待官方消息', 1, 151, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (594, '不转发，但积极评论', 0, 151, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (595, '只转发给少部分好友', 0, 151, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (596, '正确', 1, 152, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (597, '错误', 0, 152, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (598, '耐酸碱手套', 0, 153, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (599, '长袖橡胶手套', 1, 153, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (600, '石棉手套', 0, 153, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (601, '绝缘手套', 0, 153, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (602, '36.8', 0, 154, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (603, '37', 0, 154, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (604, '37.3', 1, 154, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (605, '37.7', 0, 154, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (606, '口罩', 0, 155, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (607, '护目镜', 0, 155, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (608, '保护面罩', 0, 155, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (609, '安全帽', 1, 155, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (610, '查看口罩产品包装袋生产日期', 0, 156, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (611, '查看口罩产品包装袋是否有破损', 0, 156, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (612, '打开口罩看大小尺寸，越宽松越好', 0, 156, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (613, '双手捂住口罩呼吸气，观察感觉口罩有略微鼓起或塌陷', 1, 156, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (614, '1天', 0, 157, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (615, '3天', 0, 157, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (616, '1周', 1, 157, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (617, '10天', 0, 157, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (618, '正确', 1, 158, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (619, '错误', 0, 158, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (620, '财产安全', 0, 159, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (621, '生命安全', 1, 159, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (622, '1', 1, 160, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (623, '2', 0, 160, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (624, '3', 0, 160, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (625, '4', 0, 160, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (626, '7天', 0, 161, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (627, '14天', 1, 161, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (628, '21天', 0, 161, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (629, '2-3天', 0, 161, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (630, '深色面朝内，浅色面朝外', 0, 162, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (631, '为了节约使用，两面轮流戴', 0, 162, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (632, '将折面完全展开，完全包住嘴、鼻、下颌，使口罩与面部完全贴合', 1, 162, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (633, '将有金属条的一端戴在下方', 0, 162, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (634, '对', 1, 163, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (635, '错', 0, 163, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (636, '对', 0, 164, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (637, '错', 1, 164, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (638, '哺乳动物冠状病毒', 0, 165, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (639, '禽冠状病毒', 1, 165, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (640, '会', 1, 166, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (641, '不会', 0, 166, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (642, '是', 0, 167, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (643, '否', 1, 167, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (644, '是', 0, 168, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (645, '否', 1, 168, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (646, '用肥皂清洗', 0, 169, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (647, '用流动的水', 0, 169, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (648, '清洗30秒', 0, 169, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (649, '以上全选', 1, 169, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (650, '是', 0, 170, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (651, '否', 1, 170, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (652, '是', 0, 171, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (653, '否', 1, 171, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (654, '正确', 1, 172, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (655, '错误', 0, 172, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (656, '37度', 0, 173, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (657, '45度', 0, 173, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (658, '52度', 0, 173, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (659, '56度', 1, 173, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (660, '会', 0, 174, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (661, '不会', 0, 174, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (662, '当前没有发现', 1, 174, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (663, '是', 0, 175, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (664, '否', 0, 175, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (665, '没有必要，洗手更重要', 1, 175, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (666, '能', 0, 176, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (667, '不能', 1, 176, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (668, '甲类', 0, 177, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (669, '乙类', 1, 177, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (670, '丙类', 0, 177, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (671, '其他类', 0, 177, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (672, '1小时', 0, 178, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (673, '2小时', 1, 178, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (674, '12小时', 0, 178, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (675, '24小时', 0, 178, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (676, '0-14', 0, 179, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (677, '15-39', 0, 179, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (678, '40-60', 1, 179, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (679, '60+', 0, 179, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (680, '5天', 0, 180, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (681, '7天', 0, 180, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (682, '9天', 1, 180, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (683, '11天', 0, 180, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (684, '防治并发症，治疗基础病，预防继发感染，器官功能支持', 1, 181, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (685, '以特异性治疗为主，一般、对症治疗为辅', 0, 181, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (686, '以治疗、隔离为主，治疗、护理为辅', 0, 181, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (687, '以消毒、隔离为主，治疗、护理为辅', 0, 181, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (688, '一般防护', 0, 182, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (689, '一级防护', 1, 182, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (690, '二级防护', 0, 182, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (691, '三级防护', 0, 182, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (692, '诊室安装门纱窗等防蚊虫设施', 0, 183, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (693, '诊室内安装非手触式洗手装置等消毒设施，配备便器和医疗废除物收集箱', 0, 183, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (694, '便器使用2000mg/L含氯消毒剂使用30分钟，冲洗后使用', 0, 183, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (695, '应在具备有效隔离条件和防护条件的医院隔离治疗，危重症病例应尽早收入ICU治疗', 1, 183, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (696, '飞沫和接触', 1, 184, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (697, '飞沫和粪便', 0, 184, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (698, '接触和血液', 0, 184, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (699, '血液和性', 0, 184, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (700, '1', 0, 185, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (701, '2', 1, 185, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (702, '3', 0, 185, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (703, '4', 0, 185, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (704, '3', 0, 186, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (705, '5', 0, 186, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (706, '10', 0, 186, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (707, '14', 1, 186, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (708, '急性呼吸道', 1, 187, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (709, '慢性呼吸道', 0, 187, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (710, '肾功能紊乱', 0, 187, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (711, '急性消化道', 0, 187, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (712, '吉林省', 0, 188, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (713, '广东省', 0, 188, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (714, '湖北省', 1, 188, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (715, '福建省', 0, 188, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (716, '以发热、乏力、干咳为主要表现', 1, 189, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (717, '休克', 0, 189, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (718, '抽搐', 0, 189, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (719, '无症状', 0, 189, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (720, '与病例共同居住、学习、工作的人员', 0, 190, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (721, '诊疗、护理、探视病例时采取了有效的防护措施的医护人员', 1, 190, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (722, '病例同病室的其他患者及其陪护人员', 0, 190, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (723, '与病例乘坐同一交通工具并有近距离接触人员', 0, 190, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (724, '正确', 0, 191, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (725, '错误', 1, 191, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (726, '正确', 1, 192, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (727, '错误', 0, 192, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (728, '正确', 1, 193, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (729, '错误', 0, 193, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (730, '正确', 0, 194, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (731, '错误', 1, 194, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (732, '戴口罩', 1, 195, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (733, '晚睡晚起', 0, 195, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (734, '多喝咖啡', 0, 195, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (735, '吃海鲜', 0, 195, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (736, '不带口罩赶紧就医', 1, 196, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (737, '主动佩戴医用外科口罩或医用防护口罩', 0, 196, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (738, '文明就医', 0, 196, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (739, '应主动告知医生发病前14天内情况信息', 0, 196, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (740, '呼吸道症状', 0, 197, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (741, '发热', 0, 197, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (742, '癫痫', 1, 197, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (743, '咳嗽', 0, 197, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (744, '3天', 0, 198, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (745, '1周', 0, 198, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (746, '10天', 0, 198, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (747, '2周', 1, 198, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (748, '喝板蓝根和熏醋可以预防新型冠状病毒', 0, 199, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (749, '燃放烟花能遏制呼吸道疾病的流行', 0, 199, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (750, '吸烟能预防病毒感染', 0, 199, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (751, '外出尽量佩戴医用口罩或医用防护口罩', 1, 199, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (752, '避免去疫情高发地', 0, 200, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (753, '避免到人流密集的场所', 0, 200, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (754, '避免开窗通风', 1, 200, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (755, '注意个人卫生', 0, 200, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (756, '防护手套、鞋', 0, 201, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (757, '防护服、安全带', 0, 201, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (758, '护目镜或防护面屏', 1, 201, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (759, '安全帽、防砸帽', 0, 201, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (760, '正确', 0, 202, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (761, '错误', 1, 202, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (762, 'MERSr-CoV', 0, 203, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (763, 'SARS-Cov', 0, 203, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (764, '229E', 0, 203, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (765, '2019-nCoV', 1, 203, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (766, '接触传播', 0, 204, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (767, '飞沫传播', 0, 204, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (768, '土壤传播', 1, 204, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (769, '气溶性传播', 0, 204, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (770, '可以通过一定的距离通过粘膜传播', 0, 205, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (771, '颗粒较大，不会长时间在空气中悬浮', 0, 205, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (772, '说话咳嗽等可造成飞沫传播', 0, 205, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (773, '医用口罩不能阻挡飞沫传播', 1, 205, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (774, '随时用完随时丢', 1, 206, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (775, '有发热症状需要消毒后密封丢弃', 0, 206, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (776, '处理完口罩后要洗手', 0, 206, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (777, '多喝水', 0, 207, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (778, '多吃水果', 0, 207, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (779, '多吃蔬菜', 0, 207, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (780, '多吃野生动物', 1, 207, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (781, '旅途中尽量不摘下口罩吃东西', 0, 208, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (782, '勤洗手', 0, 208, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (783, '摘口罩时不触碰外面', 0, 208, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (784, '口罩摘下来可直接放包里', 1, 208, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (785, '抽烟喝酒', 0, 209, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (786, '适当运动', 1, 209, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (787, '暴饮暴食', 0, 209, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (788, '过度熬夜', 0, 209, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (789, '正确', 0, 210, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (790, '错误', 1, 210, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (791, '正确', 0, 211, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (792, '错误', 1, 211, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (793, '正确', 0, 212, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (794, '错误', 1, 212, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (795, '正确', 0, 213, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (796, '错误', 1, 213, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (797, '正确', 0, 214, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (798, '错误', 1, 214, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (799, '正确', 0, 215, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (800, '错误', 1, 215, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (801, '正确', 0, 216, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (802, '错误', 1, 216, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (803, '正确', 0, 217, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (804, '错误', 1, 217, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (805, '正确', 0, 218, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (806, '错误', 1, 218, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (807, '正确', 1, 219, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (808, '错误', 0, 219, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (809, '正确', 0, 220, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (810, '错误', 1, 220, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (811, '正确', 0, 221, '2020-05-15 23:29:43', '2020-05-15 23:29:43');
INSERT INTO `quiz_option` VALUES (812, '错误', 1, 221, '2020-05-15 23:29:43', '2020-05-15 23:29:43');

-- ----------------------------
-- Table structure for quiz_problem
-- ----------------------------
DROP TABLE IF EXISTS `quiz_problem`;
CREATE TABLE `quiz_problem`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type_id` int(10) UNSIGNED NOT NULL,
  `create_time` timestamp(0) NOT NULL,
  `update_time` timestamp(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quiz_problem
-- ----------------------------
INSERT INTO `quiz_problem` VALUES (1, '将毛泽东思想确定为我们党一切工作的指导思想，是党的____决定的', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (2, '毛泽东思想形成的标志是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (3, '毛泽东思想是____走向成熟的', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (4, '毛泽东思想的核心和精髓是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (5, '邓小平同志在南方谈话中，为形成社会主义市场经济理论奠定了坚实基础', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (6, '邓小平理论形成的时代背景是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (7, '“三个代表”重要思想是在____的基础上提出来的', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (8, '1989年，邓小平对江泽民等新的中央领导作出了____的“政治交代”', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (9, '以人为本就是以____为本', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (10, '在中国共产党的历史上，第一个明确地提出解决思想路线这个问题的是 ', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (11, '对“实事求是”做马克思主义的解释并把它确立为中国共产党的思想路线的是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (12, '毛泽东思想的精髓和根本出发点是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (13, '中国共产党的一切工作的根本路线是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (14, '党的群众路线是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (15, '邓小平发表“解放思想、实事求是、团结一致向前看”的讲话是在', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (16, '贯彻“三个代表”重要思想，必须使全党始终保持与时俱进的精神状态，与时俱进就是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (17, '解放思想的目的和归宿是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (18, '贯穿于邓小平理论形成和发展全过程，贯穿于邓小平理论各个方面的是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (19, '近代中国的社会性质是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (20, '近代中国沦为半殖民地半封建社会的根本原因是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (21, '近代中国社会最主要的矛盾是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (22, '标志着旧民主主义革命向新民主主义革命转变的重大事件是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (23, '中国共产党第一次明确提出彻底的反帝反封建的民主革命纲领的会议是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (24, '中国人民的第一个和最凶恶的敌人是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (25, '新民主主义革命区别于旧民主主义革命的根本标志是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (26, '中国无产阶级最可靠的同盟军是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (27, '中国革命的基本问题是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (28, '我国过渡时期是指', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (29, '1956年三大改造完成后，中华人民共和国国家政权在实质上是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (30, '中国共产党的过渡时期总路线的主体是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (31, '新中国的成立标志着中国已经从半封建半殖民地社会进入', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (32, '我国大规模的有计划的社会主义建设开始的标志是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (33, '新民主主义经济成份中代表社会主义因素的是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (34, '过渡时期总路线中的“一化”指', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (35, '过渡时期总路线中的“三改”指', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (36, '在中国共产党七届二中全会上，毛泽东告诫全党：“务必使同志们继续地保持谦虚、谨慎、不骄、不躁的作风，务必使同志们继续地保持艰苦奋斗的作风。”其原因主要是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (37, '社会主义的首要的基本的理论问题是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (38, '社会主义的本质是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (39, '社会主义本质论是邓小平理论的', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (40, '在社会主义条件下，解放生产力的正确途径是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (41, '消灭剥削的物质前提是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (42, '社会主义的根本任务是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (43, '巩固和发展社会主义，充分发挥社会主义优越性的根本条件是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (44, '社会主义社会的主要矛盾是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (45, '社会主义的最终目的是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (46, '在社会主义发展史上，最早提到社会主义发展阶段问题的是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (47, '一切从实际出发，是我们制定路线、方针、政策的基本原则，现阶段中国最大的实际是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (48, '第一次提出我国社会主义制度还处于初级阶段的是在', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (49, '我国社会主义初级阶段是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (50, '社会主义初级阶段的社会性质是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (51, '社会主义初级阶段从____开始，到21世纪中叶社会主义现代化的基本实现，至少需要100年时间', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (52, '我国社会主义初级阶段的主要矛盾是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (53, '党的十二大正式提出了', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (54, '坚持党在社会主义初级阶段的基本路线不动摇，关键是坚持', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (55, '对外开放是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (56, '我国实行对外开放是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (57, '实行对外开放的前提是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (58, '对外开放是对', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (59, '我国对外开放的先头阵地是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (60, '“改革是中国的第二次革命”是从', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (61, '社会主义国家改革的性质是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (62, '社会主义改革开放是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (63, '改革、发展、稳定三者是内在统一的，其中发展是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (64, '我国社会主义初级阶段的所有制结构是____ ', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (65, '1984年10月，党的十二届三中全会通过的《中共中央关于经济体制改革的决定》首次提出的新概念是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (66, '“计划经济不等于社会主义，资本主义也有计划；市场经济不等于资本主义，社会主义也有市场。计划和市场都是经济手段。 ”对邓小平这一论断的理解不正确的是____ ', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (67, '20世纪五六十年代提出 “价值法则是一个伟大的学校” 的党的领导人是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (68, '建国后很长一段时间里，我们形成了高度集中的计划经济体制，当时选择这样的经济体制的主观条件是____ ', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (69, '在我国社会主义初级阶段，实行和不断完善按劳分配为主体、多种分配方式并存的分配制度，从根本上说是由____决定的', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (70, '如果国家拿出1亿元进行投资，组建一家国有独资公司，国家控制的资本总额是1亿元。如果组建股份公司，国家拿出1亿元投资，掌握40%的股份就可以控股，这时国有资本的支配范围就扩大到', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (71, '社会主义生产关系的基础是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (72, '任何社会发展阶段上的所有制结构，都不是由人们主观愿望决定的，而是由', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (73, '国体就是 ', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (74, '政体是指', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (75, '我国的国体是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (76, '我国现阶段的人民民主专政实质上是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (77, '我国的政体是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (78, '我国的根本政治制度是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (79, '中国特色社会主义政治文明的本质特点是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (80, '是我国的最高权力机关', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (81, '我国的政党制度是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (82, '社会主义思想道德建设的核心是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (83, '时代精神是社会主义核心价值体系的重要内容，时代精神的核心是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (84, '社会主义文化建设的根本任务是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (85, '关于文化，下列说法错误的是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (86, '深化文化体制改革必须坚持的主题是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (87, '社会主义核心价值体系的灵魂是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (88, '深化文化体制改革的重点是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (89, '社会主义核心价值体系的主题是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (90, '深化文化体制改革，保证人民基本文化权益的主要途径是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (91, '实现社会和谐，建设美好社会，始终是人类孜孜以求的', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (92, '按照马克思、恩格斯的设想，未来社会将是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (93, '明确把“社会更加和谐”列为全面建设小康社会的一个重要目标是党的', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (94, '《中共中央关于构建社会主义和谐社会若干重大问题的决定》指出，社会和谐是中国特色社会主义的', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (95, '构建社会主义和谐社会的工作方针是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (96, '构建社会主义和谐社会的重要条件是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (97, '把我国巨大的人口压力转化为人力资源优势的根本途径是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (98, '保障和改善人民生活的重要条件是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (99, '社会公平的重要体现是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (100, '台湾问题不同于香港、澳门问题，其实质是 ', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (101, '从1955年8月到1970年，中美大使级会谈历时15年，谈了136次，关于台湾问题的核心就是 ', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (102, '台湾与大陆和平统一后，台湾特别行政区可以享有比香港、澳门特别行政区更高度的自治权利，主要体现在', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (103, '正式把 “ 一国两制 ” 确定为中国的一项基本国策的会议是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (104, '解决台湾问题的前提是 ', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (105, '“一国两制”构想的提出，是从解决 ', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (106, '澳门特别行政区的回归于 ', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (107, '1995年1月江泽民发表的重要讲话，精辟地阐述了“和平统一、一国两制”思想的精髓，提出了现阶段发展两岸关系、推进祖国和平统一进程的八项主张，是解决台湾问题的一部纲领性文件。这篇讲话的题目是 ', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (108, '实现两岸关系和平发展的必由之路是 ', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (109, '科学认识和准确把握____，是制定正确发展战略和内外政策的重要前提', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (110, '第二次世界大战后至20世纪70年代，____问题成为国际社会所面临的突出问题', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (111, '党的____确认了和平与发展是当今世界的两大主题这一深刻论断', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (112, '在世界格局多极化与单边主义的斗争中，____仍然是关键因素', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (113, '1953年12月，____在会见印度政府代表团时，首次系统地提出了和平共处的五项原则', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (114, '中国坚定不移地奉行____的和平外交政策，是由我国的社会主义性质和在国际上的地位决定的', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (115, '和平共处五项原则是一个相互联系、相辅相成、不可分割的统一体，其精髓是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (116, '____这一新的理念是以胡锦涛为总书记的党中央对新时期我国外交政策目标的新概括，是指导我国对外工作和处理国际关系的新方针', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (117, '我国的外交工作归根到底就是要坚定不移地维护', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (118, '建设中国特色社会主义必须坚持全心全意依靠____的方针，这是由我们党和国家的性质、该阶级的特点及历史地位决定的', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (119, '是中国改革开放和现代化建设的基本动力', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (120, '工人阶级先进性的最根本体现在于它是____的代表', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (121, '我国的国情， 决定了____不但是我国新民主主义革命的生力军， 而且是我国现代化建设和改革开放中人数最多、最基本的依靠力量', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (122, '民族平等是指各民族在政治权利、社会地位等方面一律平等。民族平等是中国民族政策的', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (123, '解决民族问题的根本出发点和归宿是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (124, '改革开放以来，我国出现了一些新的社会阶层，其中个体、私营经济中的广大从业人员是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (125, '劳动、知识、人才和创造，四者是一个具有内在联系的统一整体，____在其中居于核心和基础的地位', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (126, '我国新时期爱国统一战线包含两个联盟，其中主体和基础联盟是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (127, '的产生和发展是中国共产党建党的根本条件', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (128, '判断一个政党是什么性质的政党，主要看', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (129, '中国共产党的宗旨是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (130, '是历史的创造者，是推动历史进步的动力', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (131, '中国共产党同一切剥削阶级政党的根本区别是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (132, '改革领导体制，关键是要正确处理____，解决党如何善于领导的问题', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (133, '是建设中国特色社会主义事业的主体，是先进生产力和先进文化的创造者，是社会主义物质文明、政治文明和精神文明协调发展的推动者，是决定我国前途命运的根本力量', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (134, '党的十七大第一次把____同思想建设、组织建设、作风建设、制度建设一起确定为党的建设的基本任务', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (135, '建设是党执政后的一项根本建设，是我们党执政后始终面临和不断探索的一个重大课题', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (136, '新冠病毒感染饮食营养专家建议：每天吃新鲜蔬菜和水果，在平时的基础上适量加量。这种说法正确吗', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (137, '新型冠状病毒感染有药物可以预防吗？', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (138, '什么是密切接触者，下列描述错误说法的是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (139, '从一般规律来看，不管在30度还是比较低的冬天的气温里，新型冠状病毒都会慢慢____，所以消毒比提升室温可以有效的预防病毒', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (140, '手卫生是预防疾病传播的重要手段，当手部有可见脏污，应当如何如理', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (141, '下列情況不属于密切接触者：', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (142, '预计接触疑似病例或临床诊断病例血液、体液、呕吐物、排泄物及其污染物品的人员，应佩戴，必要时需佩戴两层', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (143, '本次发现的新型冠状病毒与SARS和MERS冠状病毒虽同属于冠状病毒这一大家族，但基因进化分析显示它们分属于不同的亚群分支，说法正确吗？', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (144, '根据突发公共卫生事件性质、危害程度、涉及范围，突发公共卫生事件中Ⅰ级响应代表什么含义', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (145, '新型冠状病毒感染的肺炎是一种全新的冠状病毒肺炎，该病毒具有人群易感性。目前以发病多见', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (146, '可疑暴露者是指暴露于新型冠状病毒检测阳性的野生动物、物品和环境，且暴露时未采取有效防护的加工、售卖、搬运、配送或管理等人员。这种说法正确吗', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (147, '2020年1月20日,国家卫生健康委员会发布公告,新型冠状病毒感染的肺炎纳入法定传染病乙类管理,采取传染病的预防、控制措施', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (148, '新冠病毒感染饮食营养专家建议：适量多饮水，每天不少于____ml', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (149, '发生新传染病或我国尚未发现的传染病发生或传入，并有扩散趋势，或发现我国已消灭的传染病重新流行。这类情形属于级特别重大突发公共卫生事件', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (150, '作为普通民众，心理上如何应对这次新型冠状病毒肺炎，下列描述错误说法的是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (151, '如微信群内看到“未经证实”关于身边某某地又发现新的新型冠状病毒肺炎疫情情况的文字和图片信息，应该如何应对', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (152, '2020年1月25日，中共中央政治局常务委员会召开会议，习近平总书记指出，面对新型冠状病毒感染的肺炎疫情加快蔓延的严重形势，必须加强党中央集中统一领导', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (153, '接触大量疑似病例或临床诊断病例血液、体液、呕吐物、排泄物等的人员，应佩戴', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (154, '测量体温如何判断自己发热，平静状态下超过____°C', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (155, '人防护装备指用于保护人员避免接触感染性因子的各种屏障用品，下列不属于呼吸及眼防护具类的是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (156, '如何进行口罩气密性检查，下列描述正确说法的是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (157, '此次新型冠状病毒感染的肺炎约半数患者在后会出现呼吸困难，严重者可快速进展为急性呼吸窘迫综合征、脓毒症休克、难以纠正的代谢性酸中毒和出凝血功能障碍等严重症状', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (158, '无症状带毒者是指感染之后不发病，仅在呼吸道中检测到病毒，所以要求从疫情发生地回来的市民要主动报告，自我隔离。这种说法正确吗', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (159, '2020年1月20日,习近平总书记对新型冠状病毒感染的肺炎疫情作出重要指示,湖北武汉市等地近期陆续发生新型冠状病毒感染的肺炎疫情,必须引起高度重视,全力做好防控工作。目前正值春节期间,人员大范围密集流动,做好疫情防控工作十分紧要。各级党委和政府及有关部门要把人民群众____和身体健康放在第一位,制定周密方案,组织各方力量开展防控,采取切实有效措施,坚决遏制疫情蔓延势头。要全力救治患者,尽快查明病毒感染和传播原因,加强病例监测,规范处置流程', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (160, '孩子的口罩怎么选，通常来讲，岁以下的孩子不适合戴口罩', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (161, '与新型冠状病毒患者近距离接触过，需要隔离多少天？', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (162, '怎样正确戴口罩？', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (163, '新型冠状病毒的部分病人可无发热症状', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (164, '戴手套能代替手卫生', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (165, '动物冠状病毒有哪些包括', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (166, '新型冠状病毒会人传人吗？', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (167, '戴口罩一定要带n95吗？', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (168, '双黄连可预防新型冠状病毒吗？', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (169, '洗手注意些什么？', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (170, '乳铁蛋白能预防新型肺炎？', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (171, '吃草莓能预防肺炎？', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (172, '新冠状病毒仅在动物体内存活，无法在体外存活，这种说法是否正确？', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (173, '新冠状病毒在度的水中30分钟后可灭活', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (174, '新冠状病毒会感染猫、狗吗？', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (175, '出门除了带口罩之外，是否需要佩戴一次性手套？', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (176, '外出时，多带几个药店卖的口罩能提高防护作用吗？', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (177, '新型冠状病毒肺炎属于____传染病', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (178, '新型冠状病毒肺炎的报告时间为', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (179, '目前确诊的新型冠状病毒肺炎的患者年龄集中在____岁', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (180, '新型冠状病毒肺炎发病到入院的中位时间是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (181, '新型冠状病毒肺炎危重病例的治疗原则', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (182, '发热门诊与感染性疾病科室医务人员的防护级别为', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (183, '新型冠状病毒肺炎的治疗场所为', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (184, '新型冠状病毒肺炎可能的传播途径为____传播', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (185, '体温基本正常、临床症状好转，病原学检测连续____次呈阴性可出院或转至其他相关科室治疗其他疾病', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (186, '参考其他冠状病毒所致疾病的潜伏期，此次新型冠状病毒病例相关信息和当前防控实际，将密切接触者医学观察期定为____天，并对密切接触者进行观察', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (187, '这次武汉地区发生的肺炎是一种由新型冠状病毒引起严重的____症候群', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (188, '2019年12月，新型冠状病毒肺炎首先出现在我国的哪个省份', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (189, '新型冠状病毒感染的肺炎患者的临床表现为', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (190, '下列____情况不属于密切接触者', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (191, '“2019新型冠状病毒”是SARS重来说法正确吗？', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (192, '从设计上，按照对佩戴者自身防护能力排名(从高到低)：N95口罩＞外科口罩＞普通医用口罩＞普通棉口罩。这种说法正确吗？', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (193, '新冠病毒感染饮食营养专家建议：每天摄入高蛋白类食物，包括鱼、肉、蛋、奶、豆类和坚果，在平时的基础上加量,不吃野生动物。这种说法正确吗？', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (194, '开暖气或空调能预防新型冠状病毒，这种说法正确吗？', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (195, '新型冠状病毒感染肺炎确定存在人传人，____有助于预防', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (196, '如出现发热等症状就诊有何注意事项，下列描述错误说法的是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (197, '人感染新型冠状病毒后的症状，常见的症状包括哪些，下列描述错误说法的是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (198, '如果出现发热、乏力、肌肉酸痛、咳嗽、咳痰、气促等症状，都应及时救医，并同时告诉医生发病前____的旅行史，以便医生快速做出诊断', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (199, '关于新型冠状病毒谣言四起，下列描述不是谣言的是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (200, '预防新型冠状病毒感染，下列描述错误说法的是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (201, '近距离1米以内接触疑似病例或临床诊断病例的人员，应佩戴', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (202, '用了7天的N95口罩用吹风机吹或酒精消毒可继续用', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (203, '截止至目前，世界卫生组织对新型冠状病毒的命名是什么', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (204, '已知新型冠状病毒传染途径不包括那些', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (205, '关于飞沫传播不正确的是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (206, '关于废弃口罩处理方式，不正确的是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (207, '关于饮食下列说法不正确的是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (208, '关于路途中，下列做法不正确的是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (209, '提高人体免疫力，下列说法正确的是', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (210, '喝板蓝根和熏醋可以预防新型冠状病毒', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (211, '盐水漱口可以预防新型冠状病毒', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (212, '吸烟能预防新型冠状病毒', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (213, '吃抗生素能预防新型冠状病毒', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (214, '吃达菲、病毒灵能预防新型冠状病毒', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (215, '武汉爆发的新型冠状病毒已被证实为新型SARS病毒 ', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (216, '治愈病例不用担心二次感染，因为有了抗体', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (217, '吃大蒜胜过杀病毒的口腔药物', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (218, '吃香蕉会得新型冠状病毒肺炎', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (219, '营养均衡有助于提升免疫力', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (220, '喝高度白酒可以有效杀灭新冠状病毒', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');
INSERT INTO `quiz_problem` VALUES (221, '洗热水澡可以预防新冠状病毒肺炎', 2, '2020-05-15 23:29:37', '2020-05-15 23:29:37');

-- ----------------------------
-- Table structure for quiz_record
-- ----------------------------
DROP TABLE IF EXISTS `quiz_record`;
CREATE TABLE `quiz_record`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL,
  `score` int(255) UNSIGNED NULL DEFAULT NULL,
  `create_time` timestamp(0) NOT NULL,
  `update_time` timestamp(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for quiz_role
-- ----------------------------
DROP TABLE IF EXISTS `quiz_role`;
CREATE TABLE `quiz_role`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_Time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quiz_role
-- ----------------------------
INSERT INTO `quiz_role` VALUES (1, 'USER', '2020-05-07 12:58:40', '2020-05-07 12:58:42');
INSERT INTO `quiz_role` VALUES (2, 'ADMIN', '2020-05-07 12:58:53', '2020-05-07 12:58:56');

-- ----------------------------
-- Table structure for quiz_test_example
-- ----------------------------
DROP TABLE IF EXISTS `quiz_test_example`;
CREATE TABLE `quiz_test_example`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `input` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `output` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `update_time` timestamp(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quiz_test_example
-- ----------------------------
INSERT INTO `quiz_test_example` VALUES (1, '0', '0', 1, '2020-05-07 18:15:42', '2020-05-07 18:15:45');
INSERT INTO `quiz_test_example` VALUES (2, '1', '1', 1, '2020-05-07 18:15:55', '2020-05-07 18:15:57');
INSERT INTO `quiz_test_example` VALUES (3, '2', '1', 1, '2020-05-07 18:16:04', '2020-05-07 18:16:07');
INSERT INTO `quiz_test_example` VALUES (4, '1 1', '2', 2, '2020-05-08 17:14:40', '0000-00-00 00:00:00');
INSERT INTO `quiz_test_example` VALUES (5, '100 100', '200', 2, '2020-05-08 17:14:51', '0000-00-00 00:00:00');
INSERT INTO `quiz_test_example` VALUES (6, '10000 10000', '20000', 2, '2020-05-08 17:15:06', '0000-00-00 00:00:00');
INSERT INTO `quiz_test_example` VALUES (7, 'abcabcbb', '3', 3, '2020-05-12 14:39:54', '2020-05-12 14:39:56');
INSERT INTO `quiz_test_example` VALUES (8, 'bbbbb', '1', 3, '2020-05-12 14:40:16', '2020-05-12 14:40:19');
INSERT INTO `quiz_test_example` VALUES (9, 'pwwkew', '3', 3, '2020-05-12 14:40:48', '2020-05-12 14:40:47');
INSERT INTO `quiz_test_example` VALUES (10, 'abababababskhasdkhasdjkash', '6', 3, '2020-05-12 14:41:46', '2020-05-12 14:41:44');
INSERT INTO `quiz_test_example` VALUES (11, '19', 'true', 4, '2020-05-12 14:46:24', '2020-05-12 14:46:23');
INSERT INTO `quiz_test_example` VALUES (12, '87', 'false', 4, '2020-05-12 14:46:51', '2020-05-12 14:46:50');
INSERT INTO `quiz_test_example` VALUES (13, '4', 'false', 4, '2020-05-12 14:47:24', '2020-05-12 14:47:23');
INSERT INTO `quiz_test_example` VALUES (14, '100', 'true', 4, '2020-05-12 14:47:49', '2020-05-12 14:47:47');
INSERT INTO `quiz_test_example` VALUES (15, 'LEETCODEISHIRING 3', 'LCIRETOESIIGEDHN', 5, '2020-05-12 14:50:21', '2020-05-12 14:50:20');
INSERT INTO `quiz_test_example` VALUES (16, 'LEETCODEISHIRING 4', 'LDREOEIIECIHNTSG', 5, '2020-05-12 14:50:48', '2020-05-12 14:50:47');
INSERT INTO `quiz_test_example` VALUES (17, 'PAYPALISHIRINGENGLISH 5', 'PHGASINLYIREIPLIGSANH', 5, '2020-05-12 14:52:50', '2020-05-12 14:52:49');
INSERT INTO `quiz_test_example` VALUES (18, 'ab ba', '1', 6, '2020-05-12 14:55:25', '2020-05-12 14:55:24');
INSERT INTO `quiz_test_example` VALUES (19, 'abc bca', '2', 6, '2020-05-12 14:55:45', '2020-05-12 14:55:44');
INSERT INTO `quiz_test_example` VALUES (20, 'aabc abca', '2', 6, '2020-05-12 14:56:04', '2020-05-12 14:56:03');
INSERT INTO `quiz_test_example` VALUES (21, 'abcdedasdas badasdasdas', '0', 6, '2020-05-12 14:57:07', '2020-05-12 14:57:05');
INSERT INTO `quiz_test_example` VALUES (22, '()', 'true', 7, '2020-05-13 21:02:50', '2020-05-13 21:02:44');
INSERT INTO `quiz_test_example` VALUES (23, '()[]{}', 'true', 7, '2020-05-13 21:03:08', '2020-05-13 21:03:04');
INSERT INTO `quiz_test_example` VALUES (24, '(]', 'false', 7, '2020-05-13 21:03:25', '2020-05-13 21:03:18');
INSERT INTO `quiz_test_example` VALUES (25, '([)]', 'false', 7, '2020-05-13 21:03:42', '2020-05-13 21:03:40');
INSERT INTO `quiz_test_example` VALUES (26, '((((({{{}}}[][])))))', 'true', 7, '2020-05-13 21:04:41', '2020-05-13 21:04:40');
INSERT INTO `quiz_test_example` VALUES (27, '(()', '2', 8, '2020-05-13 21:05:56', '2020-05-13 21:05:54');
INSERT INTO `quiz_test_example` VALUES (28, ')()())', '4', 8, '2020-05-13 21:06:10', '2020-05-13 21:06:09');
INSERT INTO `quiz_test_example` VALUES (29, '((((((()))))))))', '14', 8, '2020-05-13 21:06:52', '2020-05-13 21:06:51');
INSERT INTO `quiz_test_example` VALUES (30, '1+1', '2', 9, '2020-05-13 21:08:41', '2020-05-13 21:08:41');
INSERT INTO `quiz_test_example` VALUES (31, '1-3', '-2', 9, '2020-05-13 21:09:06', '2020-05-13 21:09:05');
INSERT INTO `quiz_test_example` VALUES (32, '(1+(4+5+2)-3)+(6+8)', '23', 9, '2020-05-13 21:09:42', '2020-05-13 21:09:41');
INSERT INTO `quiz_test_example` VALUES (33, '1000-7', '993', 9, '2020-05-13 21:10:09', '2020-05-13 21:10:08');
INSERT INTO `quiz_test_example` VALUES (34, 'bcabc', 'abc', 10, '2020-05-13 21:11:32', '2020-05-13 21:11:31');
INSERT INTO `quiz_test_example` VALUES (35, 'cbacdcbc', 'acdb', 10, '2020-05-13 21:11:49', '2020-05-13 21:11:48');
INSERT INTO `quiz_test_example` VALUES (36, 'bcabcdadasfadassafafa', 'abcdfs', 10, '2020-05-13 21:12:27', '2020-05-13 21:12:26');
INSERT INTO `quiz_test_example` VALUES (37, 'cbbd', 'bb', 11, '2020-05-13 21:14:44', '2020-05-13 21:14:43');
INSERT INTO `quiz_test_example` VALUES (38, 'abaa', 'aba', 11, '2020-05-13 21:15:07', '2020-05-13 21:15:05');
INSERT INTO `quiz_test_example` VALUES (39, 'bbbbbb', 'bbbbbb', 11, '2020-05-13 21:15:23', '2020-05-13 21:15:22');
INSERT INTO `quiz_test_example` VALUES (40, '2', '2', 12, '2020-05-13 21:17:32', '2020-05-13 21:17:31');
INSERT INTO `quiz_test_example` VALUES (41, '3', '3', 12, '2020-05-13 21:17:44', '2020-05-13 21:17:41');
INSERT INTO `quiz_test_example` VALUES (42, '10', '89', 12, '2020-05-13 21:18:53', '2020-05-13 21:18:52');
INSERT INTO `quiz_test_example` VALUES (43, '10', '4', 13, '2020-05-13 21:21:15', '2020-05-13 21:21:14');
INSERT INTO `quiz_test_example` VALUES (44, '50', '15', 13, '2020-05-13 21:22:04', '2020-05-13 21:22:03');
INSERT INTO `quiz_test_example` VALUES (45, '100', '25', 13, '2020-05-13 21:22:25', '2020-05-13 21:22:24');

-- ----------------------------
-- Table structure for quiz_type
-- ----------------------------
DROP TABLE IF EXISTS `quiz_type`;
CREATE TABLE `quiz_type`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quiz_type
-- ----------------------------
INSERT INTO `quiz_type` VALUES (1, '编程题', '2020-05-07 18:15:01', '2020-05-07 18:15:05');
INSERT INTO `quiz_type` VALUES (2, '单选题', '2020-05-10 20:05:32', '2020-05-15 15:34:55');
INSERT INTO `quiz_type` VALUES (3, '多选题', '2020-05-15 15:34:46', '2020-05-15 15:34:48');
INSERT INTO `quiz_type` VALUES (4, '判断题', '2020-05-15 16:22:25', '2020-05-15 16:22:27');

-- ----------------------------
-- Table structure for quiz_user
-- ----------------------------
DROP TABLE IF EXISTS `quiz_user`;
CREATE TABLE `quiz_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roleid` int(11) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `update_time` timestamp(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_idx_email`(`email`) USING BTREE COMMENT 'email使用unique的hash索引'
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
