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
	id    INTEGER NOT NULL COMMENT '����Ʈ �ڵ�Խñ۹�ȣ', -- ����Ʈ �ڵ�Խñ۹�ȣ
	co_no INTEGER NOT NULL COMMENT '�ڵ�Խñ۹�ȣ', -- �ڵ�Խñ۹�ȣ
	lank  INTEGER NULL     COMMENT '����' -- ����
)
COMMENT '����Ʈ �ڵ������';

-- ����Ʈ �ڵ������
ALTER TABLE best_contr
	ADD CONSTRAINT PK_best_contr -- ����Ʈ �ڵ������ �⺻Ű
		PRIMARY KEY (
			id -- ����Ʈ �ڵ�Խñ۹�ȣ
		);

-- ����Ʈ �ڵ������ ����ũ �ε���
CREATE UNIQUE INDEX UIX_best_contr
	ON best_contr ( -- ����Ʈ �ڵ������
	);

-- ���ϸ� Ʈ����
CREATE TABLE trend (
	op_tag VARCHAR(50)  NULL COMMENT '��� ��õ �±�', -- ��� ��õ �±�
	photo  VARCHAR(255) NULL COMMENT '����' -- ����
)
COMMENT '���ϸ� Ʈ����';

-- �ڵ�Խñ�
CREATE TABLE cody_board (
	co_no    INTEGER      NOT NULL COMMENT '�ڵ�Խñ۹�ȣ', -- �ڵ�Խñ۹�ȣ
	m_no     INTEGER      NOT NULL COMMENT 'ȸ����ȣ', -- ȸ����ȣ
	title    VARCHAR(20)  NULL     COMMENT '����', -- ����
	conts    VARCHAR(255) NULL     COMMENT '����', -- ����
	id       VARCHAR(20)  NULL     COMMENT '���̵�', -- ���̵�
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
	phone   VARCHAR(30)  NULL     COMMENT '��ȭ��ȣ', -- ��ȭ��ȣ
	intro   TEXT         NULL     COMMENT '�Ұ���', -- �Ұ���
	level   INTEGER      NULL     COMMENT '���ѷ���' -- ���ѷ���
)
COMMENT 'ȸ��';

-- ȸ��
ALTER TABLE member
	ADD CONSTRAINT PK_member -- ȸ�� �⺻Ű
		PRIMARY KEY (
			m_no -- ȸ����ȣ
		);

-- ȸ�� ����ũ �ε���
CREATE UNIQUE INDEX UIX_member
	ON member ( -- ȸ��
		id ASC -- ���̵�
	);

-- ȸ�� ����ũ �ε���2
CREATE UNIQUE INDEX UIX_member2
	ON member ( -- ȸ��
		email ASC -- �̸���
	);

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

-- �����Խ���
CREATE TABLE q_board (
	q-no     INTEGER      NOT NULL COMMENT '������ȣ', -- ������ȣ
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
			q-no -- ������ȣ
		);

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

-- ģ�� ����ũ �ε���
CREATE UNIQUE INDEX UIX_friend
	ON friend ( -- ģ��
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

-- ����Ʈ �ڵ�Խ��� ���
CREATE TABLE best_board (
	bb_no INTEGER      NOT NULL COMMENT '��۹�ȣ', -- ��۹�ȣ
	id    INTEGER      NOT NULL COMMENT '����Ʈ �ڵ�Խñ۹�ȣ', -- ����Ʈ �ڵ�Խñ۹�ȣ
	m_no2 INTEGER      NOT NULL COMMENT 'ȸ����ȣ', -- ȸ����ȣ
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
	q_no    INTEGER      NOT NULL COMMENT 'FAQ��ȣ', -- FAQ��ȣ
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
			q_no -- FAQ��ȣ
		);

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
			m_no2 -- ȸ����ȣ
		)
		REFERENCES member ( -- ȸ��
			m_no -- ȸ����ȣ
		);

-- ����Ʈ �ڵ�Խ��� ���
ALTER TABLE best_board
	ADD CONSTRAINT FK_best_contr_TO_best_board -- ����Ʈ �ڵ������ -> ����Ʈ �ڵ�Խ��� ���
		FOREIGN KEY (
			id -- ����Ʈ �ڵ�Խñ۹�ȣ
		)
		REFERENCES best_contr ( -- ����Ʈ �ڵ������
			id -- ����Ʈ �ڵ�Խñ۹�ȣ
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