package lck.service;

import lck.domain.dao.TeamDao;
import lck.domain.dto.TeamDto;
import java.util.List;

public class TeamService implements CrudService<TeamDto> {
    private final TeamDao teamDao;

    // TeamDao를 직접 생성
    public TeamService() {
        this.teamDao = new TeamDao();
    }

    @Override
    public List<TeamDto> selectAll() throws Exception {
        return teamDao.selectAll();
    }

    @Override
    public TeamDto selectById(int id) throws Exception {
        return teamDao.selectById(id);
    }

    @Override
    public void insert(TeamDto team) throws Exception {
        teamDao.insert(team);
    }

    @Override
    public void update(TeamDto team) throws Exception {
        teamDao.update(team);
    }

    @Override
    public void delete(int id) throws Exception {
        teamDao.delete(id);
    }
}
