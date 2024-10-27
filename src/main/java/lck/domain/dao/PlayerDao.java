package lck.domain.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import lck.domain.dto.PlayerDto;
import lck.util.DBConnectionManager;

public class PlayerDao implements CrudDao<PlayerDto> {

	@Override
	public List<PlayerDto> selectAll() throws Exception {
		List<PlayerDto> players = new ArrayList<>();
		String sql = "SELECT p.*, t.team_name FROM Player_Tbl p JOIN Team_Tbl t ON p.team_id = t.team_id";
		try (Connection conn = DBConnectionManager.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {

			while (rs.next()) {
				PlayerDto player = new PlayerDto(rs.getInt("player_id"), rs.getInt("team_id"),
						rs.getString("player_name"), rs.getString("in_game_name"), rs.getString("position"),
						rs.getInt("age"), rs.getString("team_name") // 팀 이름 추가
				);
				players.add(player);
			}
		}
		return players;
	}

	@Override
	public PlayerDto selectById(int playerId) throws Exception {
		String sql = "SELECT * FROM Player_Tbl WHERE player_id = ?";
		PlayerDto player = null;

		try (Connection conn = DBConnectionManager.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, playerId);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					player = new PlayerDto(rs.getInt("player_id"), rs.getInt("team_id"), rs.getString("player_name"),
							rs.getString("in_game_name"), rs.getString("position"), rs.getInt("age"),
							rs.getString("team_name"));
				}
			}
		}
		return player;
	}

	@Override
	public void insert(PlayerDto player) throws Exception {
		String sql = "INSERT INTO Player_Tbl (team_id, player_name, in_game_name, position, age) VALUES (?,?,?,?,?)";

		try (Connection conn = DBConnectionManager.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, player.getTeamId());
			pstmt.setString(2, player.getPlayerName());
			pstmt.setString(3, player.getInGameName());
			pstmt.setString(4, player.getPosition());
			pstmt.setInt(5, player.getAge());

			pstmt.executeUpdate();
		}
	}

	@Override
	public void update(PlayerDto player) throws Exception {
		String sql = "UPDATE Player_Tbl SET team_id = ?, player_name = ?, in_game_name = ?, position = ?, age = ? WHERE player_id = ?";

		try (Connection conn = DBConnectionManager.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, player.getTeamId());
			pstmt.setString(2, player.getPlayerName());
			pstmt.setString(3, player.getInGameName());
			pstmt.setString(4, player.getPosition());
			pstmt.setInt(5, player.getAge());
			pstmt.setInt(6, player.getPlayerId());

			pstmt.executeUpdate();
		}
	}

	@Override
	public void delete(int playerId) throws Exception {
		String sql = "DELETE FROM Player_Tbl WHERE player_id = ?";

		try (Connection conn = DBConnectionManager.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, playerId);
			pstmt.executeUpdate();
		}
	}
}
