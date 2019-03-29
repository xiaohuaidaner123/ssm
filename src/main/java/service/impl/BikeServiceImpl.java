package service.impl;

import mapper.BikeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Bike;
import service.BikeService;

@Service
public class BikeServiceImpl implements BikeService {

    @Autowired
    private BikeMapper bikeMapper;

    @Override
    public int insertBike(Bike bike) {
        return bikeMapper.insertBike(bike);
    }
}
