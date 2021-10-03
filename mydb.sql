-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 03, 2021 at 06:57 PM
-- Server version: 8.0.22
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETEContribution` (IN `ident` INT(11))  BEGIN
 DELETE FROM contributions
 
  WHERE  contribution_id = ident;
 
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteGuarantors` (IN `ident` INT(11))  BEGIN
 DELETE FROM guarantors
 
  WHERE  id = ident;
 
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteLoanAccount` (IN `ident` INT)  BEGIN
delete from loan_account where id = ident;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteloanRepayment` (IN `ident` INT)  BEGIN
	delete from loan_repayment where id = ident;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteLoans` (IN `ident` INT)  BEGIN
delete from loans where loan_id = ident;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteMembers` (IN `indent` INT)  BEGIN
	delete from members where member_number = indent;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertContribution` (IN `member_number` INT(11), IN `contribution_date` DATE, IN `contribution_amount` INT(11))  BEGIN
    INSERT INTO `mydb`.`contributions` (`member_number`, `contribution_date`, `contribution_amount`) VALUES (member_number, contribution_date, contribution_amount);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertGurantors` (IN `loan_id` INT(11), IN `member_number` INT(11))  BEGIN
    INSERT INTO `mydb`.`guarantors` (`loan_id`, `member_number`) VALUES (loan_id, member_number);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertLoanAccount` (IN `id` INT, IN `loan_app_number` INT, IN `loan_approval_date` DATE, IN `loan_approved_amount` INT, IN `loan_disbursed_amount` INT, IN `loan_repayment_period` INT, IN `loan_balance` INT, IN `loan_monthly_repayment` INT, IN `member_number` INT)  BEGIN
INSERT INTO `mydb`.`loan_account` (`id`, `Loan_app_number`, `load_approval_date`, `loan_appoved_amount`, `loan_disbursed_amount`, `loan_repayment_period`, `loan_balance`, `loan_monthly_repayment`, `member_number`) VALUES (id,loan_app_number,loan_approval_date, loan_approved_amount, loan_disbursed_amount,
 loan_repayment_period, loan_balance, loan_monthly_repayment, member_number );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertLoanRepayments` (IN `id` INT, IN `member_number` INT, IN `loan_application_number` INT, IN `loan_repayment_amount` INT, IN `loan_repayment_date` TIMESTAMP)  BEGIN
insert into loan_repayment(id, member_number, loan_application_number, loan_repayment_amount, loan_repayment_date) values(id, member_number, loan_application_number, loan_repayment_amount, loan_repayment_date);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertLoans` (IN `loan_id` INT(11), IN `date_of_application` TIMESTAMP, IN `type_of_loan_id` INT(11), IN `loan_amount` INT(11), IN `repayment_period` INT(11), IN `treasurer_appr` TINYINT(4), IN `chairman_appr` TINYINT(4), IN `secretary_appr` TINYINT(4), IN `member_number` INT(11))  BEGIN
    INSERT INTO `mydb`.`loans` (`loan_id`, `member_number`, `date_of_application`, `type_of_loan_id`, `loan_amount`, `repayment_period`, `treasurer_appr`, `chairman_appr`, `secretary_appr`) VALUES (loan_id, member_number, date_of_application, type_of_loan_id, loan_amount, repayment_period, treasurer_appr, chairman_appr, secretary_appr);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertMembers` (IN `member_number` INT, IN `member_national_id` INT, IN `member_surname` VARCHAR(45), IN `member_fname` VARCHAR(45), IN `member_lname` VARCHAR(45), IN `member_DOB` DATE, IN `member_address` VARCHAR(45), IN `member_subcounty` VARCHAR(45), IN `member_location` VARCHAR(45), IN `member_sublocation` VARCHAR(45), IN `member_phone` VARCHAR(45), IN `member_email` VARCHAR(45), IN `member_bankname` VARCHAR(45), IN `member_branchname` VARCHAR(45), IN `member_bankaccnumber` VARCHAR(45), IN `member_accname` VARCHAR(45), IN `member_sharebal` VARCHAR(45), IN `member_accstatus` VARCHAR(45))  BEGIN
	insert into members(member_number,member_national_id,member_surname,member_fname,member_lname,member_DOB,member_address,member_subcounty,member_location,member_sublocation,member_phone,member_email,member_bankname,member_branchname,member_bankaccnumber,member_accname,	member_sharebal,member_accstatus) values(member_number,member_national_id,member_surname,member_fname,member_lname,member_DOB,member_address,member_subcounty,member_location,member_sublocation,member_phone,member_email,member_bankname,member_branchname,member_bankaccnumber,member_accname,	member_sharebal,member_accstatus);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_loan_types` (IN `id` INT, IN `type_of_loan` VARCHAR(50), IN `repayment_period` INT, IN `maximum_amount` INT)  BEGIN
insert into loan_types(id, type_of_loan, repayment_period, maximum_amount) values(id, type_of_loan, repayment_period, maximum_amount);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateContribution` (IN `ident` INT(11), IN `member_number` INT(11), IN `contribution_date` DATE, IN `contribution_amount` INT(11))  BEGIN
 UPDATE contributions SET
  member_number= member_number,
  contribution_date= contribution_date,
 
 contribution_amount = contribution_amount
 
  WHERE  contribution_id = ident;
 
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateGuarantors` (IN `ident` INT(11), IN `loan_id` INT(11), IN `member_number` INT(11))  BEGIN
 UPDATE guarantors SET
  loan_id= loan_id,
  member_number= member_number
 
  WHERE  id = ident;
 
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateLoanAccount` (IN `ident` INT, IN `loan_app_number` INT, IN `loan_approval_date` DATE, IN `loan_approved_amount` INT, IN `loan_disbursed_amount` INT, IN `loan_repayment_period` INT, IN `loan_balance` INT, IN `loan_monthly_repayment` INT, IN `member_number` INT)  BEGIN
 UPDATE loan_account SET
  loan_app_number= loan_app_number,
 load_approval_date = loan_approval_date,
 loan_approved_amount =  loan_approved_amount,
 loan_disbursed_amount = loan_disbursed_amount,
 loan_repayment_period =loan_repayment_period,
 loan_balance = loan_balance,
 loan_monthly_repayment = loan_monthly_repayment,
 member_number = member_number
 
  WHERE  id = ident;
 
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateLoanRepayments` (IN `ident` INT, IN `date_of_application` TIMESTAMP, IN `type_of_loan_id` INT(11), IN `loan_amount` INT(11), IN `repayment_period` INT(11), IN `treasurer_appr` TINYINT(4), IN `chairman_appr` TINYINT(4), IN `secretary_appr` TINYINT(4), IN `member_number` INT(11))  BEGIN
 UPDATE loan_repayment SET
  date_of_application = date_of_application,
 type_of_loan_id = type_of_loan_id,
 loan_amount =  loan_amount,
  repayment_period =  repayment_period,
   treasurer_appr =  treasurer_appr,
    chairman_appr =  chairman_appr,
     secretary_appr =  secretary_appr,
     member_number =  member_number

 
  WHERE  id = ident;
 
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateLoans` (IN `ident` INT(11), IN `date_of_application` TIMESTAMP, IN `type_of_loan_id` INT(11), IN `loan_amount` INT(11), IN `repayment_period` INT(11), IN `treasurer_appr` TINYINT(4), IN `chairman_appr` TINYINT(4), IN `secretary_appr` TINYINT(4), IN `member_number` INT(11))  BEGIN
 UPDATE loans SET
  member_number= member_number,
 date_of_application = date_of_application,
 type_of_loan_id =  type_of_loan_id,
 loan_amount = loan_amount,
 repayment_period =repayment_period,
 treasurer_appr = treasurer_appr,
 chairman_appr = chairman_appr,
 secretary_appr = secretary_appr
 
  WHERE  loan_id = ident;
 
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateLoanTypes` (IN `ident` INT, IN `type_of_loan` VARCHAR(50), IN `repayment_period` INT, IN `maximum_amount` INT)  BEGIN
 UPDATE loan_types SET
  type_of_loan= type_of_loan,
 repayment_period = repayment_period,
 maximum_amount =  maximum_amount
 
  WHERE  id = ident;
 
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateMembers` (IN `ident` INT, IN `member_national_id` INT, IN `member_surname` VARCHAR(45), IN `member_fname` VARCHAR(45), IN `member_lname` VARCHAR(45), IN `member_DOB` DATE, IN `member_address` VARCHAR(45), IN `member_subcounty` VARCHAR(45), IN `member_location` VARCHAR(45), IN `member_sublocation` VARCHAR(45), IN `member_phone` VARCHAR(45), IN `member_email` VARCHAR(45), IN `member_bankname` VARCHAR(45), IN `member_branchname` VARCHAR(45), IN `member_bankaccnumber` VARCHAR(45), IN `member_accname` VARCHAR(45), IN `member_sharebal` VARCHAR(45), IN `member_accstatus` VARCHAR(45))  BEGIN
 UPDATE members SET
  member_national_id = member_national_id,
 member_surname = member_surname,
 member_fname =  member_fname,
  member_lname =  member_lname,
   member_DOB =  member_DOB,
    member_address =  member_address,
     member_subcounty =  member_subcounty,
     member_location =  member_location,
     member_sublocation = member_sublocation,
 member_phone = member_phone,
 member_email =  member_email,
  member_bankname =  member_bankname,
   member_branchname =  member_branchname,
    member_bankaccnumber =  member_bankaccnumber,
     member_accname =  member_accname,
     member_sharebal =  member_sharebal,
     member_accstatus =  member_accstatus

 
  WHERE  member_number = ident;
 
 END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `contributions`
--

CREATE TABLE `contributions` (
  `contribution_id` int NOT NULL,
  `member_number` int NOT NULL,
  `contribution_date` date NOT NULL,
  `contribution_amount` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `contributions`
--
DELIMITER $$
CREATE TRIGGER `contributions_after_delete` AFTER DELETE ON `contributions` FOR EACH ROW BEGIN
 insert into contributions_shadow
        ( contribution_id, old_member_number, old_contribution_date ,old_contribution_amount, what, who, when_it_happened)
    values
        ( OLD.contribution_id, OLD.member_number, OLD.contribution_date, OLD.contribution_amount, 'delete', CURRENT_USER(), CURDATE());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `contributions_after_insert` AFTER INSERT ON `contributions` FOR EACH ROW BEGIN
 insert into contributions_shadow
        ( contribution_id, new_member_number, new_contribution_date ,new_contribution_amount, what, who, when_it_happened)
    values
        ( NEW.contribution_id, NEW.member_number, NEW.contribution_date, NEW.contribution_amount, 'insert', CURRENT_USER(), CURDATE());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `contributions_after_update` AFTER UPDATE ON `contributions` FOR EACH ROW BEGIN
insert into contributions_shadow
    ( contribution_id, old_member_number, old_contribution_date ,old_contribution_amount , new_member_number, new_contribution_date ,new_contribution_amount, what, who, when_it_happened)
values
    (new.contribution_id, old.member_number, old.contribution_date, old.contribution_amount, NEW.member_number, NEW.contribution_date, NEW.contribution_amount, 'update', CURRENT_USER(),  CURDATE());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `contributions_shadow`
--

CREATE TABLE `contributions_shadow` (
  `contribution_id` int DEFAULT NULL,
  `old_member_number` int DEFAULT NULL,
  `old_contribution_date` date DEFAULT NULL,
  `old_contribution_amount` int DEFAULT NULL,
  `shadow_id` int NOT NULL,
  `new_member_number` int DEFAULT NULL,
  `new_contribution_date` date DEFAULT NULL,
  `new_contribution_amount` int DEFAULT NULL,
  `who` varchar(50) DEFAULT NULL,
  `when_it_happened` date DEFAULT NULL,
  `what` varchar(50) DEFAULT NULL,
  `where` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `guarantors`
--

CREATE TABLE `guarantors` (
  `id` int NOT NULL,
  `loan_id` int NOT NULL,
  `member_number` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `guarantors_shadow`
--

CREATE TABLE `guarantors_shadow` (
  `id` int DEFAULT NULL,
  `old_loan_id` int DEFAULT NULL,
  `old_member_number` int DEFAULT NULL,
  `shadow_id` int NOT NULL,
  `new_loan_id` int DEFAULT NULL,
  `new_member_number` int DEFAULT NULL,
  `who` varchar(50) DEFAULT NULL,
  `when_it_happened` varchar(50) DEFAULT NULL,
  `what` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `loan_id` int NOT NULL,
  `member_number` int NOT NULL,
  `date_of_application` timestamp NOT NULL,
  `type_of_loan_id` int NOT NULL,
  `loan_amount` int NOT NULL,
  `repayment_period` int NOT NULL,
  `treasurer_appr` tinyint DEFAULT NULL,
  `chairman_appr` tinyint DEFAULT NULL,
  `secretary_appr` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `loans_shadow`
--

CREATE TABLE `loans_shadow` (
  `loan_id` int DEFAULT NULL,
  `old_member_number` int DEFAULT NULL,
  `old_date_of_application` timestamp NULL DEFAULT NULL,
  `old_type_of_loan_id` int DEFAULT NULL,
  `old_loan_amount` int DEFAULT NULL,
  `old_repayment_period` int DEFAULT NULL,
  `shadow_id` int NOT NULL,
  `old_treasurer_appr` tinyint DEFAULT NULL,
  `old_chairman_appr` tinyint DEFAULT NULL,
  `old_secretary_appr` tinyint DEFAULT NULL,
  `new_member_number` int DEFAULT NULL,
  `new_date_of_application` timestamp NULL DEFAULT NULL,
  `new_type_of_loan_id` int DEFAULT NULL,
  `new_loan_amount` int DEFAULT NULL,
  `new_repayment_period` int DEFAULT NULL,
  `new_treasurer_appr` tinyint DEFAULT NULL,
  `new_chairman_appr` tinyint DEFAULT NULL,
  `new_secretary_appr` tinyint DEFAULT NULL,
  `who` varchar(50) DEFAULT NULL,
  `when_it_happened` varchar(50) DEFAULT NULL,
  `what` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `loan_account`
--

CREATE TABLE `loan_account` (
  `id` int NOT NULL,
  `Loan_app_number` int NOT NULL,
  `load_approval_date` date NOT NULL,
  `loan_appoved_amount` int NOT NULL,
  `loan_disbursed_amount` int NOT NULL,
  `loan_repayment_period` int NOT NULL,
  `loan_balance` int NOT NULL,
  `loan_monthly_repayment` int NOT NULL,
  `member_number` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `loan_account_shadow`
--

CREATE TABLE `loan_account_shadow` (
  `id` int DEFAULT NULL,
  `old_loan_app_number` int DEFAULT NULL,
  `old_load_approval_date` date DEFAULT NULL,
  `old_loan_appoved_amount` int DEFAULT NULL,
  `old_loan_disbursed_amount` int DEFAULT NULL,
  `old_loan_repayment_period` int DEFAULT NULL,
  `old_loan_balance` int DEFAULT NULL,
  `shadow_id` int NOT NULL,
  `old_loan_monthly_repayment` int DEFAULT NULL,
  `old_member_number` int DEFAULT NULL,
  `new_loan_app_number` int DEFAULT NULL,
  `new_load_approval_date` date DEFAULT NULL,
  `new_loan_appoved_amount` int DEFAULT NULL,
  `new_loan_disbursed_amount` int DEFAULT NULL,
  `new_loan_repayment_period` int DEFAULT NULL,
  `new_loan_balance` int DEFAULT NULL,
  `new_loan_monthly_repayment` int DEFAULT NULL,
  `new_member_number` int DEFAULT NULL,
  `who` varchar(50) DEFAULT NULL,
  `when_it_happened` date DEFAULT NULL,
  `what` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `loan_repayment`
--

CREATE TABLE `loan_repayment` (
  `id` int NOT NULL,
  `member_number` int NOT NULL,
  `loan_application_number` int NOT NULL,
  `loan_repayment_amount` int NOT NULL,
  `loan_repayment_date` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `loan_repayment_shadow`
--

CREATE TABLE `loan_repayment_shadow` (
  `id` int DEFAULT NULL,
  `old_member_number` int DEFAULT NULL,
  `old_loan_application_number` int DEFAULT NULL,
  `old_loan_repayment_amount` int DEFAULT NULL,
  `old_loan_repayment_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `shadow_id` int NOT NULL,
  `new_member_number` int DEFAULT NULL,
  `new_loan_application_number` int DEFAULT NULL,
  `new_loan_repayment_amount` int DEFAULT NULL,
  `new_loan_repayment_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `who` varchar(50) DEFAULT NULL,
  `when_it_happened` date DEFAULT NULL,
  `what` varchar(50) DEFAULT NULL,
  `where` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `loan_types`
--

CREATE TABLE `loan_types` (
  `id` int NOT NULL,
  `type_of_loan` varchar(45) NOT NULL,
  `repayment_period` int NOT NULL,
  `maximum_amount` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `loan_types_shadow`
--

CREATE TABLE `loan_types_shadow` (
  `id` int DEFAULT NULL,
  `old_type_of_loan` varchar(45) DEFAULT NULL,
  `old_repayment_period` int DEFAULT NULL,
  `old_maximum_amount` int DEFAULT NULL,
  `shadow_id` int NOT NULL,
  `new_type_of_loan` varchar(45) DEFAULT NULL,
  `new_repayment_period` int DEFAULT NULL,
  `new_maximum_amount` int DEFAULT NULL,
  `who` varchar(50) DEFAULT NULL,
  `when_it_happened` date DEFAULT NULL,
  `what` varchar(50) DEFAULT NULL,
  `where` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `member_number` int NOT NULL,
  `member_national_id` int NOT NULL,
  `member_surname` varchar(45) NOT NULL,
  `member_fname` varchar(45) NOT NULL,
  `member_lname` varchar(45) NOT NULL,
  `member_DOB` date NOT NULL,
  `member_address` varchar(45) NOT NULL,
  `member_subcounty` varchar(45) NOT NULL,
  `member_location` varchar(45) NOT NULL,
  `member_sublocation` varchar(45) NOT NULL,
  `member_phone` varchar(45) NOT NULL,
  `member_email` varchar(45) DEFAULT NULL,
  `member_bankname` varchar(45) DEFAULT NULL,
  `member_branchname` varchar(45) DEFAULT NULL,
  `member_bankaccnumber` varchar(45) DEFAULT NULL,
  `member_accname` varchar(45) DEFAULT NULL,
  `member_sharebal` int DEFAULT NULL,
  `member_accstatus` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `members_shadow`
--

CREATE TABLE `members_shadow` (
  `member_number` int DEFAULT NULL,
  `old_member_national_id` int DEFAULT NULL,
  `old_member_surname` varchar(45) DEFAULT NULL,
  `old_member_fname` varchar(45) DEFAULT NULL,
  `old_member_lname` varchar(45) DEFAULT NULL,
  `old_member_DOB` date DEFAULT NULL,
  `old_member_address` varchar(45) DEFAULT NULL,
  `old_member_subcounty` varchar(45) DEFAULT NULL,
  `old_member_location` varchar(45) DEFAULT NULL,
  `old_member_sublocation` varchar(45) DEFAULT NULL,
  `old_member_phone` int DEFAULT NULL,
  `old_member_email` varchar(45) DEFAULT NULL,
  `old_member_bankname` varchar(45) DEFAULT NULL,
  `old_member_branchname` varchar(45) DEFAULT NULL,
  `old_member_bankaccnumber` int DEFAULT NULL,
  `old_member_accname` varchar(45) DEFAULT NULL,
  `old_member_sharebal` int DEFAULT NULL,
  `old_member_accstatus` varchar(45) DEFAULT NULL,
  `shadow_id` int NOT NULL,
  `new_member_national_id` int DEFAULT NULL,
  `new_member_surname` varchar(45) DEFAULT NULL,
  `new_member_fname` varchar(45) DEFAULT NULL,
  `new_member_lname` varchar(45) DEFAULT NULL,
  `new_member_DOB` date DEFAULT NULL,
  `new_member_address` varchar(45) DEFAULT NULL,
  `new_member_subcounty` varchar(45) DEFAULT NULL,
  `new_member_location` varchar(45) DEFAULT NULL,
  `new_member_sublocation` varchar(45) DEFAULT NULL,
  `new_member_phone` int DEFAULT NULL,
  `new_member_email` varchar(45) DEFAULT NULL,
  `new_member_bankname` varchar(45) DEFAULT NULL,
  `new_member_branchname` varchar(45) DEFAULT NULL,
  `new_member_bankaccnumber` int DEFAULT NULL,
  `new_member_accname` varchar(45) DEFAULT NULL,
  `new_member_sharebal` int DEFAULT NULL,
  `new_member_accstatus` varchar(45) DEFAULT NULL,
  `who` varchar(50) DEFAULT NULL,
  `when_it_happened` date DEFAULT NULL,
  `what` varchar(50) DEFAULT NULL,
  `where` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contributions`
--
ALTER TABLE `contributions`
  ADD PRIMARY KEY (`contribution_id`),
  ADD KEY `member_foreign_key_idx` (`member_number`);

--
-- Indexes for table `contributions_shadow`
--
ALTER TABLE `contributions_shadow`
  ADD PRIMARY KEY (`shadow_id`);

--
-- Indexes for table `guarantors`
--
ALTER TABLE `guarantors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `memid_fk_idx` (`member_number`),
  ADD KEY `loanid_fk_idx` (`loan_id`);

--
-- Indexes for table `guarantors_shadow`
--
ALTER TABLE `guarantors_shadow`
  ADD PRIMARY KEY (`shadow_id`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`loan_id`),
  ADD KEY `mber_fk_idx` (`member_number`),
  ADD KEY `type_fk1_idx` (`type_of_loan_id`),
  ADD KEY `type_fk2_idx` (`repayment_period`);

--
-- Indexes for table `loans_shadow`
--
ALTER TABLE `loans_shadow`
  ADD PRIMARY KEY (`shadow_id`);

--
-- Indexes for table `loan_account`
--
ALTER TABLE `loan_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Loan_app_number_UNIQUE` (`Loan_app_number`),
  ADD KEY `mem_fk_idx` (`member_number`);

--
-- Indexes for table `loan_account_shadow`
--
ALTER TABLE `loan_account_shadow`
  ADD PRIMARY KEY (`shadow_id`);

--
-- Indexes for table `loan_repayment`
--
ALTER TABLE `loan_repayment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `memnum1_fk_idx` (`member_number`),
  ADD KEY `appnum_fk_idx` (`loan_application_number`);

--
-- Indexes for table `loan_repayment_shadow`
--
ALTER TABLE `loan_repayment_shadow`
  ADD PRIMARY KEY (`shadow_id`);

--
-- Indexes for table `loan_types`
--
ALTER TABLE `loan_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `period` (`repayment_period`);

--
-- Indexes for table `loan_types_shadow`
--
ALTER TABLE `loan_types_shadow`
  ADD PRIMARY KEY (`shadow_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`member_number`),
  ADD UNIQUE KEY `member_number_UNIQUE` (`member_number`),
  ADD UNIQUE KEY `member_national_id_UNIQUE` (`member_national_id`),
  ADD UNIQUE KEY `member_email_UNIQUE` (`member_email`);

--
-- Indexes for table `members_shadow`
--
ALTER TABLE `members_shadow`
  ADD PRIMARY KEY (`shadow_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contributions`
--
ALTER TABLE `contributions`
  MODIFY `contribution_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `contributions_shadow`
--
ALTER TABLE `contributions_shadow`
  MODIFY `shadow_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `guarantors`
--
ALTER TABLE `guarantors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `guarantors_shadow`
--
ALTER TABLE `guarantors_shadow`
  MODIFY `shadow_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `loans_shadow`
--
ALTER TABLE `loans_shadow`
  MODIFY `shadow_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `loan_account_shadow`
--
ALTER TABLE `loan_account_shadow`
  MODIFY `shadow_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `loan_repayment_shadow`
--
ALTER TABLE `loan_repayment_shadow`
  MODIFY `shadow_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `loan_types_shadow`
--
ALTER TABLE `loan_types_shadow`
  MODIFY `shadow_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `member_number` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=346;

--
-- AUTO_INCREMENT for table `members_shadow`
--
ALTER TABLE `members_shadow`
  MODIFY `shadow_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contributions`
--
ALTER TABLE `contributions`
  ADD CONSTRAINT `member_foreign_key` FOREIGN KEY (`member_number`) REFERENCES `members` (`member_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `guarantors`
--
ALTER TABLE `guarantors`
  ADD CONSTRAINT `loanid_fk` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`loan_id`),
  ADD CONSTRAINT `memid_fk` FOREIGN KEY (`member_number`) REFERENCES `members` (`member_number`);

--
-- Constraints for table `loans`
--
ALTER TABLE `loans`
  ADD CONSTRAINT `mber_fk` FOREIGN KEY (`member_number`) REFERENCES `members` (`member_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `loan_account`
--
ALTER TABLE `loan_account`
  ADD CONSTRAINT `loan_id` FOREIGN KEY (`Loan_app_number`) REFERENCES `loans` (`loan_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mem_fk` FOREIGN KEY (`member_number`) REFERENCES `members` (`member_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `loan_repayment`
--
ALTER TABLE `loan_repayment`
  ADD CONSTRAINT `appnum_fk` FOREIGN KEY (`loan_application_number`) REFERENCES `loan_account` (`Loan_app_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `memnum1_fk` FOREIGN KEY (`member_number`) REFERENCES `members` (`member_number`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
