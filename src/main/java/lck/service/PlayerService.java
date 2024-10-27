package lck.service;

import lck.domain.dao.PlayerDao;
import lck.domain.dto.PlayerDto;
import java.util.List;

public class PlayerService implements CrudService<PlayerDto> {
   	private final PlayerDao playerDao;

    public PlayerService() {
        this.playerDao = new PlayerDao();
    }

    @Override
    public List<PlayerDto> selectAll() throws Exception {
        return playerDao.selectAll();
    }

    @Override
    public PlayerDto selectById(int id) throws Exception {
        return playerDao.selectById(id);
    }

    @Override
    public void insert(PlayerDto player) throws Exception {
        playerDao.insert(player);
    }

    @Override
    public void update(PlayerDto player) throws Exception {
        playerDao.update(player);
    }

    @Override
    public void delete(int id) throws Exception {
        playerDao.delete(id);
    }
}
