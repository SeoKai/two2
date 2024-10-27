package lck.service;

import lck.domain.dao.PlayerRecordDao;
import lck.domain.dto.PlayerRecordDto;
import java.util.List;

public class PlayerRecordService implements CrudService<PlayerRecordDto> {
    private final PlayerRecordDao playerRecordDao;

    public PlayerRecordService() {
        this.playerRecordDao = new PlayerRecordDao();
    }

    @Override
    public List<PlayerRecordDto> selectAll() throws Exception {
        return playerRecordDao.selectAll();
    }

    @Override
    public PlayerRecordDto selectById(int id) throws Exception {
        return playerRecordDao.selectById(id);
    }

    @Override
    public void insert(PlayerRecordDto record) throws Exception {
        playerRecordDao.insert(record);
    }

    @Override
    public void update(PlayerRecordDto record) throws Exception {
        playerRecordDao.update(record);
    }

    @Override
    public void delete(int id) throws Exception {
        playerRecordDao.delete(id);
    }
}
