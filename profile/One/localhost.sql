-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2019-01-16 13:25:58
-- 服务器版本： 10.1.37-MariaDB
-- PHP 版本： 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `bookadmin`
--
CREATE DATABASE IF NOT EXISTS `bookadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bookadmin`;

-- --------------------------------------------------------

--
-- 表的结构 `book`
--

CREATE TABLE `book` (
  `book_id` int(10) NOT NULL,
  `book_name` varchar(50) NOT NULL,
  `book_author` varchar(50) NOT NULL,
  `book_press` varchar(50) NOT NULL,
  `book_time` varchar(20) NOT NULL,
  `book_price` float NOT NULL,
  `book_isbn` varchar(30) NOT NULL,
  `book_introduction` text NOT NULL,
  `book_image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `book`
--

INSERT INTO `book` (`book_id`, `book_name`, `book_author`, `book_press`, `book_time`, `book_price`, `book_isbn`, `book_introduction`, `book_image`) VALUES
(10, '围城(精)', '钱钟书', '人民文学出版社', '2019-01-15 10:30', 39, '9787020090006', '《围城》是一幅栩栩如生的世井百态图，人生的酸甜苦辣千般滋味均在其中得到了淋漓尽致的体现。钱钟书先生将自己的语言天才并入极其渊博的知识，再添加上一些讽刺主义的幽默调料，以一书而定江山。《围城》显示给我们一个真正的聪明人是怎样看人生，又怎样用所有作家都必得使用的文字来表述自己的“观”和“感”的。', 'https://img1.doubanio.com/view/subject/l/public/s11276847.jpg'),
(11, '活着（新版）', '余华', '作家出版社', '2019-01-17 14:25', 28, '9787506365437', '《活着(新版)》讲述了农村人福贵悲惨的人生遭遇。福贵本是个阔少爷，可他嗜赌如命，终于赌光了家业，一贫如洗。他的父亲被他活活气死，母亲则在穷困中患了重病，福贵前去求药，却在途中被国民党抓去当壮丁。经过几番波折回到家里，才知道母亲早已去世，妻子家珍含辛茹苦地养大两个儿女。此后更加悲惨的命运一次又一次降临到福贵身上，他的妻子、儿女和孙子相继死去，最后只剩福贵和一头老牛相依为命，但老人依旧活着，仿佛比往日更加洒脱与坚强。', 'https://img3.doubanio.com/view/subject/l/public/s29053580.jpg'),
(12, '你不知道的JavaScript', ' [美] Kyle Simpson ', '人民邮电出版社', '1899-12-07 05:25', 49, '9787115431165', 'JavaScript语言有很多复杂的概念，但却用简单的方式体现出来（比如回调函数），因此，JavaScript开发者无需理解语言内部的原理，就能编写出功能全面的程序；就像收音机一样，你无需理解里面的管子和线圈都是做什么用的，只要会操作收音机上的按键，就可以收听你喜欢的节目。然而，JavaScript的这些复杂精妙的概念才是语言的精髓，即使是经验丰富的JavaScript开发者，如果没有认真学习也无法真正理解语言本身的特性。正是因为绝大多数人不求甚解，一遇到出乎意料的行为就认为是语言本身有缺陷，进而把相关的特性加入黑名单，久而久之就排除了这门语言的多样性，人为地使它变得不完整、不安全。', 'https://img3.doubanio.com/view/subject/l/public/s28033372.jpg'),
(13, 'JavaScript权威指南', '弗拉纳根 ', '机械工业出版社', '2019-01-18 14:30', 109, '9787111216322', '《JavaScript权威指南(第5版)》全面介绍了JavaScript语言的核心，以及Web浏览器中实现的遗留和标准的DOM。它运用了一些复杂的例子，说明如何处理验证表单数据、使用cookie、创建可移植的DHTML动画等常见任务。\r\n《JavaScript权威指南(第5版)》还包括详细的参考手册，涵盖了JavaScript的核心API、遗留的客户端API和W3C标准DOM API，记述了这些API中的每一个JavaScript对象、方法、性质、构造函数、常量和事件处理程序。', 'https://img3.doubanio.com/view/subject/l/public/s5860151.jpg'),
(14, 'JavaScript 函数式编程', '[美] Michael Fogus ', '人民邮电出版社', '2018-05-16 14:30', 49, '9787115390608', 'javaScript 是近年来非常受瞩目的一门编程语言，它既支持面向对象编程，也支持函数式编程。本书专门介绍JavaScript函数式编程的特性。\r\n全书共9章，分别介绍了JavaScript函数式编程、一等函数与Applicative编程、变量的作用域和闭包、高阶函数、由函数构建函数、递归、纯度和不变性以及更改政策、基于流的编程、类编程。除此之外，附录中还介绍了更多函数式JavaScript。', 'https://img1.doubanio.com/view/subject/l/public/s28263518.jpg'),
(15, 'JavaScript语言精粹', 'Douglas Crockford ', '电子工业出版社', '2014-03-05 14:30', 35, '9787121084379', '本书通过对JavaScript语言的分析，甄别出好的和坏的特性，从而提取出相对这门语言的整体而言具有更好的可靠性、可读性和可维护性的JavaScript的子集，以便你能用它创建真正可扩展的和高效的代码。\r\n雅虎资深JavaScript架构师Douglas Crockford倾力之作。\r\n向读者介绍如何运用JavaScript创建真正可扩展的和高效的代码。', 'https://img3.doubanio.com/view/subject/l/public/s3651235.jpg'),
(16, '高性能JavaScript', '[美] 尼古拉斯·泽卡斯 ', '电子工业出版社', '2019-06-05 18:35', 49, '9787121119323', '如果你使用JavaScript构建交互丰富的Web应用，那么JavaScript代码可能是造成你的Web应用速度变慢的主要原因。《高性能JavaScript》揭示的技术和策略能帮助你在开发过程中消除性能瓶颈。你将会了解如何提升各方面的性能，包括代码的加载、运行、DOM交互、页面生存周期等。雅虎的前端工程师Nicholas C. Zakas和其他五位JavaScript专家介绍了页面代码加载的最佳方法和编程技巧，来帮助你编写更为高效和快速的代码。你还会了解到构建和部署文件到生产环境的最佳实践，以及有助于定位线上问题的工具。', 'https://img3.doubanio.com/view/subject/l/public/s4538004.jpg'),
(17, 'JavaScript设计模式', '张容铭 ', '人民邮电出版社', '2015-08-01 00:00', 59, '9787115396860', '《JavaScript设计模式》共分六篇四十章，首先讨论了几种函数的编写方式，体会JavaScript在编程中的灵活性；然后讲解了面向对象编程的知识，其中讨论了类的创建、数据的封装以及类之间的继承；最后探讨了各种模式的技术，如简单工厂模式，包括工厂方法模式、抽象工厂模式、建造者模式、原型模式、单例模式，以及外观模式，包括适配器模式。本书还讲解了几种适配器、代理模式、装饰者模式和MVC模式，讨论了如何实现对数据、视图、控制器的分离。在讲解MVP模式时，讨论了如何解决数据与视图之间的耦合，并实现了一个模板生成器；讲解MVVM模式时，讨论了双向绑定对MVC的模式演化。本书几乎包含了关于JavaScript设计模式的全部知识，是进行JavaScript高效编程必备的学习手册。', 'https://img1.doubanio.com/view/subject/l/public/s28273777.jpg'),
(18, '图解HTTP', '[日] 上野宣 ', '人民邮电出版社', '2014-04-15 05:05', 49, '9787115351531', '本书对互联网基盘——HTTP协议进行了全面系统的介绍。作者由HTTP协议的发展历史娓娓道来，严谨细致地剖析了HTTP协议的结构，列举诸多常见通信场景及实战案例，最后延伸到Web安全、最新技术动向等方面。本书的特色为在讲解的同时，辅以大量生动形象的通信图例，更好地帮助读者深刻理解HTTP通信过程中客户端与服务器之间的交互情况。读者可通过本书快速了解并掌握HTTP协议的基础，前端工程师分析抓包数据，后端工程师实现REST API、实现自己的HTTP服务器等过程中所需的HTTP相关知识点本书均有介绍。', 'https://img3.doubanio.com/view/subject/l/public/s27283822.jpg'),
(19, 'HTTP权威指南', 'David Gourley / Brian Totty ', '人民邮电出版社', '1899-12-25 13:05', 109, '9787115281487', '超文本转移协议（Hypertext Transfer Protocol，HTTP）是在万维网上进行通信时所使用的协议方案。HTTP有很多应用，但最著名的是用于web浏览器和web服务器之间的双工通信。\r\n\r\nHTTP起初是一个简单的协议，因此你可能会认为关于这个协议没有太多好 说的。但现在，你手上拿着的是却一本两磅重 的书。如果你对我们怎么会写出一本650页 的关于HTTP的书感到奇怪的话，可以去看一下目录。本书不仅仅是一本HTTP首部的参考手册；它是一本名副其实的web结构圣经。', 'https://img1.doubanio.com/view/subject/l/public/s11329547.jpg'),
(20, '深入浅出Node.js', '朴灵 ', '人民邮电出版社', '2013-12-02 00:25', 69, '9787115335500', '本书从不同的视角介绍了 Node 内在的特点和结构。由首章Node 介绍为索引，涉及Node 的各个方面，主要内容包含模块机制的揭示、异步I/O 实现原理的展现、异步编程的探讨、内存控制的介绍、二进制数据Buffer 的细节、Node 中的网络编程基础、Node 中的Web 开发、进程间的消息传递、Node 测试以及通过Node 构建产品需要的注意事项。最后的附录介绍了Node 的安装、调试、编码规范和NPM 仓库等事宜。', 'https://img3.doubanio.com/view/subject/l/public/s27269296.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_password`) VALUES
(1, 'wang', 'chong');

--
-- 转储表的索引
--

--
-- 表的索引 `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`);

--
-- 表的索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `book`
--
ALTER TABLE `book`
  MODIFY `book_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
