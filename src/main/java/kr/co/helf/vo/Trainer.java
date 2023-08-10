package kr.co.helf.vo;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
@Alias("Trainer")
public class Trainer {
	
	private int trainerNo;
	private String trainerFile;
	private Date resignationDate;
	private String title;
	private User user;
	private Date hiredDate;
	private List<Career> careers;

	
	

}