package boardModel;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardDTO {

	private int num;
	private String writer;
	private String email;
	private String subject;
	private String password;
	private String reg_date;
	private int ref;
	private int re_step;
	private int re_level;
	private int readcount;
	private String content;

}
