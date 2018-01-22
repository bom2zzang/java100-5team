package java100.app.dao;

import java.util.List;
import java.util.Map;

import java100.app.domain.Score;

public interface ScoreDao {

    List<Score> findAll(Map<String,Object> params);
    int insert(Score score);
    int countAll();
    int update(Score score);
    int delete(int no);
    Score findByNo(int no);
    
    
}