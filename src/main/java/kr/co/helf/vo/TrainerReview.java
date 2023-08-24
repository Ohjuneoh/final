package kr.co.helf.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

import java.util.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
@Alias("TrainerReview")
public class TrainerReview {

    private int no;
    private String title;
    private String content;
    private Date createDate;
    private String status;

    private LessonApply lessonApply;

    private LessonApply apply;

    private Lesson lesson;
    private Trainer trainer;
    private Double rating;


    // 별점을 적용시키기 위해 생성한 getter 메소드
    public int getFillCount() {
        return rating.intValue();
    }

    public int getHalfCount() {
        return rating > getFillCount() ? 1 : 0;
    }

    public int getEmptyCount() {
        return 5 - getFillCount() - getHalfCount();
    }
}