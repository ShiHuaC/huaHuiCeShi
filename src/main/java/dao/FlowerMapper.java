package dao;

import entity.Flower;

import java.util.List;

public interface FlowerMapper {
   public List<Flower> cx();
   public int add(Flower flower);
   public int  cxcm(String name);
}
