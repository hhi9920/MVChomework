package kr.ac.hansung.model;

import javax.validation.constraints.NotEmpty;

import lombok.Getter;
import lombok.NoArgsConstructor;

import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class GradeDetail {

	
	private int year;
	private int semester;
	private int grade;
	
	//@NotEmpty(message="The classcode cannot be empty")
	private String classcode;

	private String classname;
	private String division;
}
