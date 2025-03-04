package com.ruoyi.point.service;

import com.ruoyi.point.domain.OasPoint;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/3/4 9:21
 */
public interface OasPointService {
    List<OasPoint> getAllPoints();
    OasPoint getPointById(Long pointId);
    boolean addPoint(OasPoint point);
    boolean updatePoint(OasPoint point);
    boolean deletePoint(Long pointId);
}
