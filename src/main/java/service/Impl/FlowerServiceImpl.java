package service.Impl;

import dao.FlowerMapper;
import entity.Flower;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.FlowerService;

import java.util.List;

@Service
public class FlowerServiceImpl implements FlowerService{
	@Autowired
    FlowerMapper fImpl;
	public List<Flower> cx() {
		return fImpl.cx();
	}

	public int add(Flower flower) {
		return fImpl.add(flower);
	}

	public int cxcm(String name) {
		return fImpl.cxcm(name);
	}

}
