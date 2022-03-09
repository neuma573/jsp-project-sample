CREATE TABLE `MENU` (
  `MENU_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '메뉴 ID',
  `MENU_CD` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '메뉴 CD',
  `MENU_NM` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '메뉴명',
  `USE_YN` char(1) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '사용여부',
  `LVL` int(11) DEFAULT NULL COMMENT '단계',
  `ORD` int(11) DEFAULT NULL COMMENT '코드노출순서',
  `URL` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'URL',
  `UPPER_MENU_ID` int(11) DEFAULT NULL COMMENT '상위 메뉴 ID',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='메뉴';

CREATE TABLE `ROLE` (
  `ROLE_ID` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '권한 ID',
  `ROLE_NM` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '권한명',
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='권한';

CREATE TABLE `ROLE_MENU_MAP` (
  `ROLE_ID` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '권한 ID',
  `MENU_ID` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '메뉴 ID',
  PRIMARY KEY (`ROLE_ID`,`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='권한-메뉴 매핑';

CREATE TABLE `USER` (
  `USER_ID` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '사용자 ID',
  `USER_DOMAIN` varchar(20) COLLATE utf8mb3_unicode_ci NULL COMMENT '사용자 도메인',
  `USER_NM` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '사용자 이름',
  `USER_PWD` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '사용자 비밀번호',
  `DEL_YN` char(1) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '삭제여부',
  `STATUS` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '상태 : 사용(USE), 중지(NOTUSE), 차단(LOCK)',
  `PHONE` varchar(12) COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '휴대폰번호',
  `EMAIL` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '이메일',
  `LOGIN_FAIL_CNT` int(11) DEFAULT 0 COMMENT '로그인 실패 수',
  `LAST_LOGIN_DT` datetime DEFAULT NULL COMMENT '최근 로그인 일시',
  `PWD_CHG_DT` datetime DEFAULT NULL COMMENT '비밀번호 변경일시',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  `UPDATE_DT` datetime DEFAULT NULL COMMENT '수정일시',
  `REG_USER_ID` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '등록자 ID',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='사용자';

CREATE TABLE `USER_AUTH_NUM` (
  `USER_ID` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '사용자 ID',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  `ISS_NUM` varchar(6) COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '발행인증번호',
  `AUTH_FAIL_CNT` int(11) DEFAULT 0 COMMENT 'SMS인증 실패 수',
  `ISS_LOCK_YN` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'N' COMMENT '번호발행잠김여부',
  PRIMARY KEY (`USER_ID`,`REG_DT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='사용자 인증번호';

CREATE TABLE `USER_PWD_HST` (
  `USER_ID` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '사용자 ID',
  `USER_PWD` varchar(200) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '사용자 비밀번호',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  PRIMARY KEY (`USER_ID`,`REG_DT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='사용자 비밀번호 이력';

CREATE TABLE `USER_ROLE_MAP` (
  `USER_ID` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '사용자 ID',
  `ROLE_ID` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '권한 ID',
  PRIMARY KEY (`USER_ID`,`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='사용자-권한 매핑';

CREATE TABLE `BOARD` (
  `BOARD_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '글ID',
  `BOARD_USER` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '작성자',
  `BOARD_NM` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '글제목',
  `BOARD_CONTENT` text NOT NULL COMMENT '내용',
  `BOARD_REG_DT` datetime NOT NULL COMMENT '생성일',
  `BOARD_MOD_DT` datetime DEFAULT NULL COMMENT '수정일',
  `BOARD_VIEW` int(11) COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '조회수',
  `BOARD_COMMENT` int(11) DEFAULT NULL COMMENT '댓글수'
  PRIMARY KEY (`BOARD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='게시판';

CREATE TABLE `COMMENT` (
  `COMMENT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '댓글ID',
  `COMMENT_UPPER` int(11) NOT NULL COMMENT '부모게시글아이디',
  `COMMENT_PARENT` int(11) NOT NULL COMMENT '부모댓글',
  `COMMENT_DEPTH` int(11) NOT NULL COMMENT '댓글깊이수준',
  `COMMENT_ORDER` int(11) NOT NULL COMMENT '순서',
  `COMMENT_USER` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '작성자',
  `COMMENT_CONTENT` text NOT NULL COMMENT '내용',
  `COMMENT_REG_DT` datetime NOT NULL COMMENT '생성일'
  PRIMARY KEY (`COMMENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='댓글';

CREATE TABLE `FILE` (
  `FILE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '파일ID',
  `FILE_UPPER` int(11) NOT NULL COMMENT '부모게시글아이디',
  `FILE_NAME` int(11) NOT NULL COMMENT '부모댓글',
  `FILE_SIZE` text NOT NULL COMMENT '내용',
  `FILE_REG_DT` datetime NOT NULL COMMENT '생성일',
  PRIMARY KEY (`FILE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='파일';

