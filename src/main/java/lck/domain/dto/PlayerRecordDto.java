package lck.domain.dto;

public class PlayerRecordDto {

	private int playerId;
	private String playerName; // 선수 이름 필드 추가
	private int totalKills;
	private int totalAssists;
	private int totalDeaths;
	private int totalGamesPlayed;
	private int totalWins;
	private int totalLosses;
	private int totalTrophies;

	// 기본 생성자
	public PlayerRecordDto() {
		super();
	}

	// 매개변수 생성자
	public PlayerRecordDto(int playerId, String playerName, int totalKills, int totalAssists, int totalDeaths,
			int totalGamesPlayed, int totalWins, int totalLosses, int totalTrophies) {
		this.playerId = playerId;
		this.playerName = playerName;
		this.totalKills = totalKills;
		this.totalAssists = totalAssists;
		this.totalDeaths = totalDeaths;
		this.totalGamesPlayed = totalGamesPlayed;
		this.totalWins = totalWins;
		this.totalLosses = totalLosses;
		this.totalTrophies = totalTrophies;
	}

	public PlayerRecordDto(int playerId, int totalKills, int totalAssists, int totalDeaths, int totalGamesPlayed,
			int totalWins, int totalLosses, int totalTrophies) {
		this.playerId = playerId;
		this.totalKills = totalKills;
		this.totalAssists = totalAssists;
		this.totalDeaths = totalDeaths;
		this.totalGamesPlayed = totalGamesPlayed;
		this.totalWins = totalWins;
		this.totalLosses = totalLosses;
		this.totalTrophies = totalTrophies;
	}

	public String getPlayerName() {
		return playerName;
	}

	public void setPlayerName(String playerName) {
		this.playerName = playerName;
	}

	// Getter and Setter
	public int getPlayerId() {
		return playerId;
	}

	public void setPlayerId(int playerId) {
		this.playerId = playerId;
	}

	public int getTotalKills() {
		return totalKills;
	}

	public void setTotalKills(int totalKills) {
		this.totalKills = totalKills;
	}

	public int getTotalAssists() {
		return totalAssists;
	}

	public void setTotalAssists(int totalAssists) {
		this.totalAssists = totalAssists;
	}

	public int getTotalDeaths() {
		return totalDeaths;
	}

	public void setTotalDeaths(int totalDeaths) {
		this.totalDeaths = totalDeaths;
	}

	public int getTotalGamesPlayed() {
		return totalGamesPlayed;
	}

	public void setTotalGamesPlayed(int totalGamesPlayed) {
		this.totalGamesPlayed = totalGamesPlayed;
	}

	public int getTotalWins() {
		return totalWins;
	}

	public void setTotalWins(int totalWins) {
		this.totalWins = totalWins;
	}

	public int getTotalLosses() {
		return totalLosses;
	}

	public void setTotalLosses(int totalLosses) {
		this.totalLosses = totalLosses;
	}

	public int getTotalTrophies() {
		return totalTrophies;
	}

	public void setTotalTrophies(int totalTrophies) {
		this.totalTrophies = totalTrophies;
	}

	// toString 재정의
	@Override
	public String toString() {
		return "PlayerRecordDto [playerId=" + playerId + ", totalKills=" + totalKills + ", totalAssists=" + totalAssists
				+ ", totalDeaths=" + totalDeaths + ", totalGamesPlayed=" + totalGamesPlayed + ", totalWins=" + totalWins
				+ ", totalLosses=" + totalLosses + ", totalTrophies=" + totalTrophies + "]";
	}

}
