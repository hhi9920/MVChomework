package kr.ac.hansung.dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.ac.hansung.model.Grade;
import kr.ac.hansung.model.GradeDetail;



@Repository
public class GradeDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	//get sum of each year grade
	public List<Grade> getyeargrade() {
		String sqlStatement ="select year, semester, sum(grade) from grade_detail group by year, semester;";
		
		return jdbcTemplate.query(sqlStatement,
				new RowMapper<Grade>() {
				
					public Grade mapRow(ResultSet rs, int rowNum) throws SQLException {
						//rs = record
						Grade grade = new Grade();
						
						grade.setYear(rs.getInt("year"));
						grade.setSemester(rs.getInt("semester"));
						grade.setGrade(rs.getInt("sum(grade)"));
						return grade;
					} 
		});
		
	}
		//query and return a multiple objects
		public List<GradeDetail> getgrades() {
			String sqlStatement ="select * from grade_detail";
			
			return jdbcTemplate.query(sqlStatement,
					new RowMapper<GradeDetail>() {
					
						public GradeDetail mapRow(ResultSet rs, int rowNum) throws SQLException {
							//rs = record
							GradeDetail gradedetail = new GradeDetail();
							
							gradedetail.setYear(rs.getInt("year"));
							gradedetail.setSemester(rs.getInt("semester"));
							gradedetail.setClasscode(rs.getString("classcode"));
							gradedetail.setClassname(rs.getString("classname"));
							gradedetail.setDivision(rs.getString("division"));
							gradedetail.setGrade(rs.getInt("grade"));
							return gradedetail;
						} 
			});
		
	}

		//return each year,semester grades
		public List<GradeDetail> getdetailgrades(int year, int semester) {
			String sqlStatement ="select * from grade_detail where year=? and semester=?";
			
			return jdbcTemplate.query(sqlStatement, new Object[] {year, semester},
					new RowMapper<GradeDetail>() {
					
						public GradeDetail mapRow(ResultSet rs, int rowNum) throws SQLException {
							//rs = record
							GradeDetail gradedetail = new GradeDetail();
							
							gradedetail.setYear(rs.getInt("year"));
							gradedetail.setSemester(rs.getInt("semester"));
							gradedetail.setClasscode(rs.getString("classcode"));
							gradedetail.setClassname(rs.getString("classname"));
							gradedetail.setDivision(rs.getString("division"));
							gradedetail.setGrade(rs.getInt("grade"));
							return gradedetail;
						} 
			});
		}
		
		//query and return a multiple objects
		public List<GradeDetail> getDivisionGrades() {
			String sqlStatement ="select division, sum(grade) from grade_detail group by division";
			
			return jdbcTemplate.query(sqlStatement,
					new RowMapper<GradeDetail>() {
					
						public GradeDetail mapRow(ResultSet rs, int rowNum) throws SQLException {
							//rs = record
							GradeDetail gradedetail = new GradeDetail();
							
					
							gradedetail.setDivision(rs.getString("division"));
							gradedetail.setGrade(rs.getInt("sum(grade)"));
							return gradedetail;
						} 
			});
		
	}

		

		public boolean insert(GradeDetail gradedetail) {
			int year = gradedetail.getYear();
			int semester=gradedetail.getSemester();
			String classCode=gradedetail.getClasscode();
			String className=gradedetail.getClassname();
			String division = gradedetail.getDivision();
			int grade=gradedetail.getGrade();
			
			String sqlStatement ="insert into grade_detail values (?, ?, ?, ?, ?, ?)";
			
			
			return (jdbcTemplate.update(sqlStatement, new Object[] {year, semester, classCode, className, division, grade}) ==1);
		}

}
