package com.ict.edu;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

//미리만들어진거를 셋터를 이용해서 쓴다 . 전역변수를 주고 미리만들어진걸 쓰고 .
public class DAO {
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	// DB 처리하는 메서드들

	// 전체보기
	public List<VO> getList() {
		String sql = "select * from members order by m_idx";
		return jdbcTemplate.query(sql, new RowMapper() {
			// RowMapper 인터페이스 아니면 추상 이다
			// 그래서 오버라이드를 해주어야 한다.
			@Override
			public VO mapRow(ResultSet rs, int rowNum) throws SQLException {
				// Object 안에 VO 가 들어온다.
				// Object를 VO로 변경
				// rs = ResultSet 대소문자는 그냥 내가 쓴거
				// rs는 번호를 활용한다. 다른것도 있다.
				VO vo = new VO();
				vo.setM_idx(rs.getString(1));
				vo.setM_id(rs.getString(2));
				vo.setM_pw(rs.getString(3));
				vo.setM_name(rs.getString(4));
				vo.setM_reg(rs.getString(5).substring(0, 10));
				vo.setM_addr(rs.getString(6));
				return vo;
			}

		});

	}

	// 상세 정보 가져오기
	public List<VO> getOneList(String m_idx) {
		String sql = "select * from members where m_idx = ?";
		// m_idx는 아래와 같이 m_idx를 집어넣으면 알아서 들어간다.
		// 하나 더 들어가고 싶다? 그럼 순서대로 넣어주면 된다.
		return jdbcTemplate.query(sql, new RowMapper() {
			@Override
			public VO mapRow(ResultSet rs, int rowNum) throws SQLException {
				VO vo = new VO();
				vo.setM_idx(rs.getString(1));
				vo.setM_id(rs.getString(2));
				vo.setM_pw(rs.getString(3));
				vo.setM_name(rs.getString(4));
				vo.setM_reg(rs.getString(5).substring(0, 10));
				vo.setM_addr(rs.getString(6));
				return vo;
			}
		}, m_idx);
	}
	// 상세 정보 지우기  insert , update, delete => jdbcTemplate.update(sql,? 대신 들어갈 값)
	//	?가 여러개 인 경우=> jdbcTemplate.update(sql,? 대신 들어갈 값,대신 들어갈 값,대신 들어갈 값,여러개)
	public int getDelete(String m_idx) {
		String sql = "delete from members where m_idx =?";
		return jdbcTemplate.update(sql,m_idx);
	}
}
