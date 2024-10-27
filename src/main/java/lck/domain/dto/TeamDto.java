package lck.domain.dto;

public class TeamDto {
    private int teamId;
    private String teamName;
    private int lckTitles;
    private int worldsTitles;
    private String teamColor;
    private String teamHeadCoach;
    
    // 기본 생성자
	public TeamDto() {
		super();
	}
	
	// 매개변수 생성자
	public TeamDto(int teamId, String teamName, int lckTitles, int worldsTitles, String teamColor,
			String teamHeadCoach) {
		super();
		this.teamId = teamId;
		this.teamName = teamName;
		this.lckTitles = lckTitles;
		this.worldsTitles = worldsTitles;
		this.teamColor = teamColor;
		this.teamHeadCoach = teamHeadCoach;
	}
	
	//Getter and Setter
	public int getTeamId() {
		return teamId;
	}
	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public int getLckTitles() {
		return lckTitles;
	}
	public void setLckTitles(int lckTitles) {
		this.lckTitles = lckTitles;
	}
	public int getWorldsTitles() {
		return worldsTitles;
	}
	public void setWorldsTitles(int worldsTitles) {
		this.worldsTitles = worldsTitles;
	}
	public String getTeamColor() {
		return teamColor;
	}
	public void setTeamColor(String teamColor) {
		this.teamColor = teamColor;
	}
	public String getTeamHeadCoach() {
		return teamHeadCoach;
	}
	public void setTeamHeadCoach(String teamHeadCoach) {
		this.teamHeadCoach = teamHeadCoach;
	}
	
    // toString 재정의
	@Override
	public String toString() {
		return "TeamDto [teamId=" + teamId + ", teamName=" + teamName + ", lckTitles=" + lckTitles + ", worldsTitles="
				+ worldsTitles + ", teamColor=" + teamColor + ", teamHeadCoach=" + teamHeadCoach + "]";
	}
    
    
}
