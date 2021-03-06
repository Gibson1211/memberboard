## 프로젝트 정의
 - 회원(member)과 게시판(board)으로 분리 작성하여 연동
 	member는 controller - service - repository - mapper로 구성
 	board와 comment는 controller - service interface - serviceimpl - repository - mapper로 구성
 	- ajax로 아이디 중복확인
 	- 로그인 완료시 페이징처리된 글목록화면으로 이동
 	- 로그아웃 완료시 index 페이지로 이동
 	
 	- admin
 		- 관리자페이지에서 회원 목록 페이지로 이동
 		- 회원목록 페이지에서 회원 삭제
	- 일반회원
		- 게시글작성, 조회
		- 본인이 작성한 글에 대해서만 글상세조회시 수정, 삭제
		
	- 게시판
	 	- 글쓰기 화면 출력되면 로그인 아이디가 작성자 칸에 입력되어 있음
	 	- 한화면에 5개씩 글보기
		- 글수정, 글삭제는 작성자 본인만 가능하고 관리자는 삭제만 가능
		- 작성자, 제목으로 검색되며 페이징처리
		
	- 댓글
		- 댓글작성시 로그인 아이디가 미리 채워져있으며 내용만 작성
		
	- 마이페이지
		- 로그인 시 마이페이지 이동 링크 삽입
		- 마이페이지 내에서 비밀번호 체크 후 회원정보 수정 
 
 
Member 
 		private long m_number;
		private String m_id;
		private String m_password;
		private String m_name;
		private String m_email;
		private MultipartFile m_file;
		private String m_filename;
		
 board
 		private long b_number;
		private String b_title;
		private String b_writer;
		private String b_contents;
		private int b_hits;
		private Timestamp b_date;
		private String b_filename;
		
 comment
 		private long c_number;
		private long b_number;
		private String c_writer;
		private String c_contents;
		private Timestamp c_date;
		private String m_id;
		
 page
 		private int page;
		private int maxPage;
		private int startPage;
		private int endPage;
			
			

## DB 관련
	1. 계정 : spring_kgm
	2. 비번 : 1234
	3.db 이름 : spring_study
	 

	- member
	create table member_table(
	 m_number bigint auto_increment,
    m_id varchar(20),
    m_password varchar(20),
    m_name varchar(10),
    m_email varchar(30),
    m_filename varchar(100),
    constraint primary key(m_number), constraint unique key(m_id));
    
   - board
    create table board_table(
	b_number bigint auto_increment,
    b_title varchar(50),
    b_writer varchar(20),   
    b_contents varchar(1000),
    b_hits int default 0,
    b_date datetime,
    b_filename varchar(100),
    m_id varchar(20),
    constraint primary key(b_number),
		constraint foreign key(b_writer) references member_table(m_id)
        );
        
   - comment
    create table comment_table(
	c_number bigint auto_increment,
    b_number bigint,
    c_writer varchar(20),
    c_contents varchar(200),
    c_date datetime,
    constraint primary key(c_number)
    );      
    
    
		#   m e m b e r b o a r d  
 