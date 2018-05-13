-- ����Ʈ �ڵ������
DROP TABLE IF EXISTS best_contr RESTRICT;

-- ���ϸ� Ʈ����
DROP TABLE IF EXISTS trend RESTRICT;

-- �ڵ�Խñ�
DROP TABLE IF EXISTS cody_board RESTRICT;

-- ����м�
DROP TABLE IF EXISTS analysis RESTRICT;

-- ȸ��
DROP TABLE IF EXISTS member RESTRICT;

-- ��������
DROP TABLE IF EXISTS notice RESTRICT;

-- �����Խ���
DROP TABLE IF EXISTS q_board RESTRICT;

-- ģ��
DROP TABLE IF EXISTS friend RESTRICT;

-- �ڵ�Խ��� ���
DROP TABLE IF EXISTS cody_comment RESTRICT;

-- ����Ʈ �ڵ�Խ��� ���
DROP TABLE IF EXISTS best_board RESTRICT;

-- ���ƿ�
DROP TABLE IF EXISTS liked RESTRICT;

-- FAQ
DROP TABLE IF EXISTS faq RESTRICT;

-- ����Ʈ �ڵ������
CREATE TABLE best_contr (
	bc_no INTEGER NOT NULL COMMENT '����Ʈ �ڵ�Խñ۹�ȣ', -- ����Ʈ �ڵ�Խñ۹�ȣ
	co_no INTEGER NOT NULL COMMENT '�ڵ�Խñ۹�ȣ', -- �ڵ�Խñ۹�ȣ
	lank  INTEGER NULL     COMMENT '����' -- ����
)
COMMENT '����Ʈ �ڵ������';

-- ����Ʈ �ڵ������
ALTER TABLE best_contr
	ADD CONSTRAINT PK_best_contr -- ����Ʈ �ڵ������ �⺻Ű
		PRIMARY KEY (
			bc_no -- ����Ʈ �ڵ�Խñ۹�ȣ
		);

ALTER TABLE best_contr
	MODIFY COLUMN bc_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '����Ʈ �ڵ�Խñ۹�ȣ';

-- ���ϸ� Ʈ����
CREATE TABLE trend (
	op_tag VARCHAR(50)  NULL COMMENT '��� ��õ �±�', -- ��� ��õ �±�
	photo  VARCHAR(255) NULL COMMENT '����' -- ����
)
COMMENT '���ϸ� Ʈ����';

-- �ڵ�Խñ�
CREATE TABLE cody_board (
	co_no    INTEGER      NOT NULL COMMENT '�ڵ�Խñ۹�ȣ', -- �ڵ�Խñ۹�ȣ
	title    VARCHAR(20)  NULL     COMMENT '����', -- ����
	conts    VARCHAR(255) NULL     COMMENT '����', -- ����
	m_no     INTEGER      NOT NULL COMMENT 'ȸ����ȣ', -- ȸ����ȣ
	datetime DATE         NULL     COMMENT '��¥', -- ��¥
	co_photo VARCHAR(255) NULL     COMMENT '����', -- ����
	gender   VARCHAR(5)   NULL     COMMENT '����', -- ����
	views    INTEGER      NULL     COMMENT '��ȸ��', -- ��ȸ��
	h_tag    VARCHAR(50)  NULL     COMMENT '�ؽ��±�' -- �ؽ��±�
)
COMMENT '�ڵ�Խñ�';

-- �ڵ�Խñ�
ALTER TABLE cody_board
	ADD CONSTRAINT PK_cody_board -- �ڵ�Խñ� �⺻Ű
		PRIMARY KEY (
			co_no -- �ڵ�Խñ۹�ȣ
		);

ALTER TABLE cody_board
	MODIFY COLUMN co_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '�ڵ�Խñ۹�ȣ';

-- ����м�
CREATE TABLE analysis (
	ana_no INTEGER     NOT NULL COMMENT '�м���ȣ', -- �м���ȣ
	m_no   INTEGER     NOT NULL COMMENT 'ȸ����ȣ', -- ȸ����ȣ
	h_tag  VARCHAR(50) NULL     COMMENT '�ؽ��±�' -- �ؽ��±�
)
COMMENT '����м�';

-- ����м�
ALTER TABLE analysis
	ADD CONSTRAINT PK_analysis -- ����м� �⺻Ű
		PRIMARY KEY (
			ana_no -- �м���ȣ
		);

ALTER TABLE analysis
	MODIFY COLUMN ana_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '�м���ȣ';

-- ȸ��
CREATE TABLE member (
	m_no    INTEGER      NOT NULL COMMENT 'ȸ����ȣ', -- ȸ����ȣ
	m_photo VARCHAR(255) NULL     COMMENT '����', -- ����
	name    VARCHAR(50)  NOT NULL COMMENT '�̸�', -- �̸�
	email   VARCHAR(40)  NOT NULL COMMENT '�̸���', -- �̸���
	id      VARCHAR(20)  NOT NULL COMMENT '���̵�', -- ���̵�
	pwd     VARCHAR(100) NOT NULL COMMENT '��й�ȣ', -- ��й�ȣ
	age     INTEGER      NOT NULL COMMENT '����', -- ����
	gender  VARCHAR(5)   NOT NULL COMMENT '����', -- ����
	phone   VARCHAR(30)  NOT NULL COMMENT '��ȭ��ȣ', -- ��ȭ��ȣ
	intro   TEXT         NULL     COMMENT '�Ұ���', -- �Ұ���
	level   INTEGER      NOT NULL COMMENT '���ѷ���', -- ���ѷ���
	top     INTEGER      NULL     COMMENT '����', -- ����
	pants   INTEGER      NULL     COMMENT '����' -- ����
)
COMMENT 'ȸ��';

-- ȸ��
ALTER TABLE member
	ADD CONSTRAINT PK_member -- ȸ�� �⺻Ű
		PRIMARY KEY (
			m_no -- ȸ����ȣ
		);

-- ȸ�� ���̵�
CREATE UNIQUE INDEX UIX_member
	ON member ( -- ȸ��
		id ASC -- ���̵�
	);

-- ȸ�� �̸���
CREATE UNIQUE INDEX UIX_member2
	ON member ( -- ȸ��
		email ASC -- �̸���
	);

ALTER TABLE member
	MODIFY COLUMN m_no INTEGER NOT NULL AUTO_INCREMENT COMMENT 'ȸ����ȣ';

-- ��������
CREATE TABLE notice (
	n_no  INTEGER      NOT NULL COMMENT '�������׹�ȣ', -- �������׹�ȣ
	title VARCHAR(20)  NOT NULL COMMENT '����', -- ����
	conts VARCHAR(255) NOT NULL COMMENT '����', -- ����
	date  DATE         NULL     COMMENT '��¥' -- ��¥
)
COMMENT '��������';

-- ��������
ALTER TABLE notice
	ADD CONSTRAINT PK_notice -- �������� �⺻Ű
		PRIMARY KEY (
			n_no -- �������׹�ȣ
		);

ALTER TABLE notice
	MODIFY COLUMN n_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '�������׹�ȣ';

-- �����Խ���
CREATE TABLE q_board (
	q_no     INTEGER      NOT NULL COMMENT '������ȣ', -- ������ȣ
	m_no     INTEGER      NOT NULL COMMENT 'ȸ����ȣ', -- ȸ����ȣ
	title    VARCHAR(20)  NULL     COMMENT '����', -- ����
	conts    VARCHAR(255) NULL     COMMENT '����', -- ����
	datetime DATE         NULL     COMMENT '��¥', -- ��¥
	comment  TEXT         NULL     COMMENT '�亯', -- �亯
	views    INTEGER      NULL     COMMENT '��ȸ��' -- ��ȸ��
)
COMMENT '�����Խ���';

-- �����Խ���
ALTER TABLE q_board
	ADD CONSTRAINT PK_q_board -- �����Խ��� �⺻Ű
		PRIMARY KEY (
			q_no -- ������ȣ
		);

ALTER TABLE q_board
	MODIFY COLUMN q_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '������ȣ';

-- ģ��
CREATE TABLE friend (
	m_no  INTEGER NOT NULL COMMENT '�ȷο�', -- �ȷο�
	m_no2 INTEGER NOT NULL COMMENT '�ȷ���' -- �ȷ���
)
COMMENT 'ģ��';

-- ģ��
ALTER TABLE friend
	ADD CONSTRAINT PK_friend -- ģ�� �⺻Ű
		PRIMARY KEY (
			m_no,  -- �ȷο�
			m_no2  -- �ȷ���
		);

-- �ڵ�Խ��� ���
CREATE TABLE cody_comment (
	com_no INTEGER      NOT NULL COMMENT '��۹�ȣ', -- ��۹�ȣ
	m_no   INTEGER      NOT NULL COMMENT 'ȸ����ȣ', -- ȸ����ȣ
	co_no  INTEGER      NOT NULL COMMENT '�ڵ�Խñ۹�ȣ', -- �ڵ�Խñ۹�ȣ
	conts  VARCHAR(255) NULL     COMMENT '����', -- ����
	date   DATE         NULL     COMMENT '��¥' -- ��¥
)
COMMENT '�ڵ�Խ��� ���';

-- �ڵ�Խ��� ���
ALTER TABLE cody_comment
	ADD CONSTRAINT PK_cody_comment -- �ڵ�Խ��� ��� �⺻Ű
		PRIMARY KEY (
			com_no -- ��۹�ȣ
		);

ALTER TABLE cody_comment
	MODIFY COLUMN com_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '��۹�ȣ';

-- ����Ʈ �ڵ�Խ��� ���
CREATE TABLE best_board (
	bb_no INTEGER      NOT NULL COMMENT '��۹�ȣ', -- ��۹�ȣ
	bc_no INTEGER      NOT NULL COMMENT '����Ʈ �ڵ�Խñ۹�ȣ', -- ����Ʈ �ڵ�Խñ۹�ȣ
	m_no  INTEGER      NOT NULL COMMENT 'ȸ����ȣ', -- ȸ����ȣ
	conts VARCHAR(255) NULL     COMMENT '����', -- ����
	date  DATE         NULL     COMMENT '��¥' -- ��¥
)
COMMENT '����Ʈ �ڵ�Խ��� ���';

-- ����Ʈ �ڵ�Խ��� ���
ALTER TABLE best_board
	ADD CONSTRAINT PK_best_board -- ����Ʈ �ڵ�Խ��� ��� �⺻Ű
		PRIMARY KEY (
			bb_no -- ��۹�ȣ
		);

ALTER TABLE best_board
	MODIFY COLUMN bb_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '��۹�ȣ';

-- ���ƿ�
CREATE TABLE liked (
	m_no  INTEGER NOT NULL COMMENT 'ȸ����ȣ', -- ȸ����ȣ
	co_no INTEGER NOT NULL COMMENT '�ڵ�Խñ۹�ȣ' -- �ڵ�Խñ۹�ȣ
)
COMMENT '���ƿ�';

-- ���ƿ�
ALTER TABLE liked
	ADD CONSTRAINT PK_liked -- ���ƿ� �⺻Ű
		PRIMARY KEY (
			m_no,  -- ȸ����ȣ
			co_no  -- �ڵ�Խñ۹�ȣ
		);

-- FAQ
CREATE TABLE faq (
	faq_no  INTEGER      NOT NULL COMMENT 'FAQ��ȣ', -- FAQ��ȣ
	title   VARCHAR(20)  NULL     COMMENT '����', -- ����
	conts   VARCHAR(255) NULL     COMMENT '����', -- ����
	date    DATE         NULL     COMMENT '��¥', -- ��¥
	comment TEXT         NULL     COMMENT '�亯', -- �亯
	views   INTEGER      NULL     COMMENT '��ȸ��' -- ��ȸ��
)
COMMENT 'FAQ';

-- FAQ
ALTER TABLE faq
	ADD CONSTRAINT PK_faq -- FAQ �⺻Ű
		PRIMARY KEY (
			faq_no -- FAQ��ȣ
		);

ALTER TABLE faq
	MODIFY COLUMN faq_no INTEGER NOT NULL AUTO_INCREMENT COMMENT 'FAQ��ȣ';

-- ����Ʈ �ڵ������
ALTER TABLE best_contr
	ADD CONSTRAINT FK_cody_board_TO_best_contr -- �ڵ�Խñ� -> ����Ʈ �ڵ������
		FOREIGN KEY (
			co_no -- �ڵ�Խñ۹�ȣ
		)
		REFERENCES cody_board ( -- �ڵ�Խñ�
			co_no -- �ڵ�Խñ۹�ȣ
		);

-- �ڵ�Խñ�
ALTER TABLE cody_board
	ADD CONSTRAINT FK_member_TO_cody_board -- ȸ�� -> �ڵ�Խñ�
		FOREIGN KEY (
			m_no -- ȸ����ȣ
		)
		REFERENCES member ( -- ȸ��
			m_no -- ȸ����ȣ
		);

-- ����м�
ALTER TABLE analysis
	ADD CONSTRAINT FK_member_TO_analysis -- ȸ�� -> ����м�
		FOREIGN KEY (
			m_no -- ȸ����ȣ
		)
		REFERENCES member ( -- ȸ��
			m_no -- ȸ����ȣ
		);

-- �����Խ���
ALTER TABLE q_board
	ADD CONSTRAINT FK_member_TO_q_board -- ȸ�� -> �����Խ���
		FOREIGN KEY (
			m_no -- ȸ����ȣ
		)
		REFERENCES member ( -- ȸ��
			m_no -- ȸ����ȣ
		);

-- ģ��
ALTER TABLE friend
	ADD CONSTRAINT FK_member_TO_friend -- ȸ�� -> ģ��
		FOREIGN KEY (
			m_no -- �ȷο�
		)
		REFERENCES member ( -- ȸ��
			m_no -- ȸ����ȣ
		);

-- ģ��
ALTER TABLE friend
	ADD CONSTRAINT FK_member_TO_friend2 -- ȸ�� -> ģ��2
		FOREIGN KEY (
			m_no2 -- �ȷ���
		)
		REFERENCES member ( -- ȸ��
			m_no -- ȸ����ȣ
		);

-- �ڵ�Խ��� ���
ALTER TABLE cody_comment
	ADD CONSTRAINT FK_member_TO_cody_comment -- ȸ�� -> �ڵ�Խ��� ���
		FOREIGN KEY (
			m_no -- ȸ����ȣ
		)
		REFERENCES member ( -- ȸ��
			m_no -- ȸ����ȣ
		);

-- �ڵ�Խ��� ���
ALTER TABLE cody_comment
	ADD CONSTRAINT FK_cody_board_TO_cody_comment -- �ڵ�Խñ� -> �ڵ�Խ��� ���
		FOREIGN KEY (
			co_no -- �ڵ�Խñ۹�ȣ
		)
		REFERENCES cody_board ( -- �ڵ�Խñ�
			co_no -- �ڵ�Խñ۹�ȣ
		);

-- ����Ʈ �ڵ�Խ��� ���
ALTER TABLE best_board
	ADD CONSTRAINT FK_member_TO_best_board -- ȸ�� -> ����Ʈ �ڵ�Խ��� ���
		FOREIGN KEY (
			m_no -- ȸ����ȣ
		)
		REFERENCES member ( -- ȸ��
			m_no -- ȸ����ȣ
		);

-- ����Ʈ �ڵ�Խ��� ���
ALTER TABLE best_board
	ADD CONSTRAINT FK_best_contr_TO_best_board -- ����Ʈ �ڵ������ -> ����Ʈ �ڵ�Խ��� ���
		FOREIGN KEY (
			bc_no -- ����Ʈ �ڵ�Խñ۹�ȣ
		)
		REFERENCES best_contr ( -- ����Ʈ �ڵ������
			bc_no -- ����Ʈ �ڵ�Խñ۹�ȣ
		);

-- ���ƿ�
ALTER TABLE liked
	ADD CONSTRAINT FK_member_TO_liked -- ȸ�� -> ���ƿ�
		FOREIGN KEY (
			m_no -- ȸ����ȣ
		)
		REFERENCES member ( -- ȸ��
			m_no -- ȸ����ȣ
		);

-- ���ƿ�
ALTER TABLE liked
	ADD CONSTRAINT FK_cody_board_TO_liked -- �ڵ�Խñ� -> ���ƿ�
		FOREIGN KEY (
			co_no -- �ڵ�Խñ۹�ȣ
		)
		REFERENCES cody_board ( -- �ڵ�Խñ�
			co_no -- �ڵ�Խñ۹�ȣ
		);