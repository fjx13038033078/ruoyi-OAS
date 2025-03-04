package com.ruoyi.point.service.impl;

import com.ruoyi.point.domain.OasPoint;
import com.ruoyi.point.mapper.OasPointMapper;
import com.ruoyi.point.service.OasPointService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author 范佳兴
 * @date 2025/3/4 9:21
 */
@Service
@RequiredArgsConstructor
public class OasPointServiceImpl implements OasPointService {
    private final OasPointMapper oasPointMapper;

    @Override
    public List<OasPoint> getAllPoints() {
        return oasPointMapper.getAllPoints();
    }

    @Override
    public OasPoint getPointById(Long pointId) {
        return oasPointMapper.getPointById(pointId);
    }

    @Override
    public boolean addPoint(OasPoint point) {
        return oasPointMapper.addPoint(point) > 0;
    }

    @Override
    public boolean updatePoint(OasPoint point) {
        return oasPointMapper.updatePoint(point) > 0;
    }

    @Override
    public boolean deletePoint(Long pointId) {
        return oasPointMapper.deletePoint(pointId) > 0;
    }
}
