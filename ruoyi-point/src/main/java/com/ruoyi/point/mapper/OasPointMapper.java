package com.ruoyi.point.mapper;

import com.ruoyi.point.domain.OasPoint;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/3/4 9:19
 */
@Mapper
public interface OasPointMapper {
    List<OasPoint> getAllPoints();
    OasPoint getPointById(Long pointId);
    int addPoint(OasPoint point);
    int updatePoint(OasPoint point);
    int deletePoint(Long pointId);
}
