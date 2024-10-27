package lck.domain.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import lck.domain.dto.TeamDto;
import lck.util.DBConnectionManager;

public class TeamDao implements CrudDao<TeamDto> {

    @Override
    public List<TeamDto> selectAll() throws Exception {
        List<TeamDto> teams = new ArrayList<>();
        String sql = "SELECT * FROM Team_Tbl";

        try (Connection conn = DBConnectionManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                TeamDto team = new TeamDto(
                    rs.getInt("team_id"),
                    rs.getString("team_name"),
                    rs.getInt("lck_titles"),
                    rs.getInt("worlds_titles"),
                    rs.getString("team_color"),
                    rs.getString("team_headcoach")
                );
                teams.add(team);
            }
        }
        return teams;
    }

    @Override
    public TeamDto selectById(int teamId) throws Exception {
        String sql = "SELECT * FROM Team_Tbl WHERE team_id = ?";
        TeamDto team = null;

        try (Connection conn = DBConnectionManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, teamId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    team = new TeamDto(
                        rs.getInt("team_id"),
                        rs.getString("team_name"),
                        rs.getInt("lck_titles"),
                        rs.getInt("worlds_titles"),
                        rs.getString("team_color"),
                        rs.getString("team_headcoach")
                    );
                }
            }
        }
        return team;
    }

    @Override
    public void insert(TeamDto team) throws Exception {
        String sql = "INSERT INTO Team_Tbl (team_name, lck_titles, worlds_titles, team_color, team_headcoach) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBConnectionManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, team.getTeamName());
            pstmt.setInt(2, team.getLckTitles());
            pstmt.setInt(3, team.getWorldsTitles());
            pstmt.setString(4, team.getTeamColor());
            pstmt.setString(5, team.getTeamHeadCoach());

            pstmt.executeUpdate();
        }
    }

    @Override
    public void update(TeamDto team) throws Exception {
        String sql = "UPDATE Team_Tbl SET team_name = ?, lck_titles = ?, worlds_titles = ?, team_color = ?, team_headcoach = ? WHERE team_id = ?";

        try (Connection conn = DBConnectionManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, team.getTeamName());
            pstmt.setInt(2, team.getLckTitles());
            pstmt.setInt(3, team.getWorldsTitles());
            pstmt.setString(4, team.getTeamColor());
            pstmt.setString(5, team.getTeamHeadCoach());
            pstmt.setInt(6, team.getTeamId());

            pstmt.executeUpdate();
        }
    }

    @Override
    public void delete(int teamId) throws Exception {
        String sql = "DELETE FROM Team_Tbl WHERE team_id = ?";

        try (Connection conn = DBConnectionManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, teamId);
            pstmt.executeUpdate();
        }
    }
}
