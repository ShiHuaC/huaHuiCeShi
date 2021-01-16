package controller;

import entity.Flower;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import service.FlowerService;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

/*
* @Controller
* 控制器
* */
@Controller
public class FlowerController {
    /*
     * @Autowired
     * 自动填充对象
     * */
    @Autowired
    private FlowerService service;
    /*
     * @RequestMapping("/getList")
     * 设置访问路径
     *
     * Model 保存值 request作用域
     * */
    @RequestMapping("/getList")
    public String getList(Model model){
        List<Flower> list=service.cx();
        model.addAttribute("flist",list);
        return "index";
    }
    @RequestMapping("/toAdd")
    public String toAdd(){
        return "add";
    }
    @RequestMapping("/addFlower")

    /*
     * Flower flower
     * Flower对象用于添加，框架会把数据自动保存到对象里，但前提是 ，前台的名字要和数据库里的属性名一致
     *
     * MultipartFile上传文件存储
     *
     * RequestParam可以为空
     *  return "redirect:跳转的路径";  本页面跳转
     * */
    public String addFlower(Flower flower
            , @RequestParam(value = "flowerImg",required = false) MultipartFile file
            , HttpServletRequest request){
        String picPath=null;//图片路径
        //判断上传文件是否空
        if (!file.isEmpty()){
            //获取本地上传路径
            String path=request.getSession().getServletContext().getRealPath("statics/uploadfile");
            //判断文件格式
            String prefix=FilenameUtils.getExtension(file.getOriginalFilename());
            if(prefix.equalsIgnoreCase("jpg")||prefix.equalsIgnoreCase("png")){
                //构造文件名字
                String filename=System.currentTimeMillis()+flower.getId()+"."+prefix;
                File file1=new File(path,filename);//文件对象
                try {
                    file.transferTo(file1);//将文件写入到文件对象里,执行保存
                    picPath="statics/uploadfile/"+filename;//保存在数据库中的文件 路径+名字
                } catch (IOException e) {
                    request.setAttribute("uploadError","上传失败");
                    e.printStackTrace();
                    return "add";
                }
            }else{
                request.setAttribute("uploadError","图片格式不正确");
                return "add";
            }
        }
        flower.setPath(picPath);
        int rows=service.add(flower);
        if(rows>0){
            return "redirect:/getList";
        }
        return "add";
    }
}
