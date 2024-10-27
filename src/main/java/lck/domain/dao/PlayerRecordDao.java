package lck.domain.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import lck.domain.dto.PlayerRecordDto;
import lck.util.DBConnectionManager;

public class PlayerRecordDao implements CrudDao<PlayerRecordDto> {

    @Override
    public List<PlayerRecordDto> selectAll() throws Exception {
        List<PlayerRecordDto> records = new ArrayList<>();
        String sql = "SELECT pr.player_id, p.player_name, pr.total_kills, pr.total_assists, pr.total_deaths, " +
                     "pr.total_games_played, pr.total_wins, pr.total_losses, pr.total_trophies " +
                     "FROM Player_Record_Tbl pr " +
                     "JOIN Player_Tbl p ON pr.player_id = p.player_id";

        try (Connection conn = DBConnectionManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                PlayerRecordDto record = new PlayerRecordDto(
                    rs.getInt("player_id"),
                    rs.getString("player_name"),
                    rs.getInt("total_kills"),
                    rs.getInt("total_assists"),
                    rs.getInt("total_deaths"),
                    rs.getInt("total_games_played"),
                    rs.getInt("total_wins"),
                    rs.getInt("total_losses"),
                    rs.getInt("total_trophies")
                );
                records.add(record);
            }
        }
        return records;
    }

    @Override
    public PlayerRecordDto selectById(int playerId) throws Exception {
        String sql = "SELECT pr.player_id, p.player_name, pr.total_kills, pr.total_assists, pr.total_deaths, " +
                     "pr.total_games_played, pr.total_wins, pr.total_losses, pr.total_trophies " +
                     "FROM Player_Record_Tbl pr " +
                     "JOIN Player_Tbl p ON pr.player_id = p.player_id " +
                     "WHERE pr.player_id = ?";
        PlayerRecordDto record = null;

        try (Connection conn = DBConnectionManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, playerId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    record = new PlayerRecordDto(
                        rs.getInt("player_id"),
                        rs.getString("player_name"), // 선수 이름 추가
                        rs.getInt("total_kills"),
                        rs.getInt("total_assists"),
                        rs.getInt("total_deaths"),
                        rs.getInt("total_games_played"),
                        rs.getInt("total_wins"),
                        rs.getInt("total_losses"),
                        rs.getInt("total_trophies")
                    );
                }
            }
        }
        return record;
    }


    @Override
    public void insert(PlayerRecordDto record) throws Exception {
        String sql = "INSERT INTO Player_Record_Tbl (player_id, total_kills, total_assists, total_deaths, total_games_played, total_wins, total_losses, total_trophies) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnectionManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, record.getPlayerId());
            pstmt.setInt(2, record.getTotalKills());
            pstmt.setInt(3, record.getTotalAssists());
            pstmt.setInt(4, record.getTotalDeaths());
            pstmt.setInt(5, record.getTotalGamesPlayed());
            pstmt.setInt(6, record.getTotalWins());
            pstmt.setInt(7, record.getTotalLosses());
            pstmt.setInt(8, record.getTotalTrophies());

            pstmt.executeUpdate();
        }
    }

    @Override
    public void update(PlayerRecordDto record) throws Exception {
        String sql = "UPDATE Player_Record_Tbl SET total_kills = ?, total_assists = ?, total_deaths = ?, total_games_played = ?, total_wins = ?, total_losses = ?, total_trophies = ? WHERE player_id = ?";

        try (Connection conn = DBConnectionManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, record.getTotalKills());
            pstmt.setInt(2, record.getTotalAssists());
            pstmt.setInt(3, record.getTotalDeaths());
            pstmt.setInt(4, record.getTotalGamesPlayed());
            pstmt.setInt(5, record.getTotalWins());
            pstmt.setInt(6, record.getTotalLosses());
            pstmt.setInt(7, record.getTotalTrophies());
            pstmt.setInt(8, record.getPlayerId());

            pstmt.executeUpdate();
        }
    }

    @Override
    public void delete(int playerId) throws Exception {
        String sql = "DELETE FROM Player_Record_Tbl WHERE player_id = ?";

        try (Connection conn = DBConnectionManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, playerId);
            pstmt.executeUpdate();
        }
    }
}
