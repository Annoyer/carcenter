package com.carcenter.util;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
/**
 * Created by joy12 on 2017/11/5.
 */
public class FileUpload {
    public static final String MENHU_ROOT_PATH = "pics/";

    //    路径规范 images/2012/9/25/1343287394783.jpg  按照时间戳来生成
    public static String uploadFile(MultipartFile file, HttpServletRequest request) throws IOException {

        if (!file.isEmpty()) {
            try {
                System.out.println("头像原始图片文件名：" + file.getOriginalFilename());
                //相对路径
                String fileRelativePath = "/carPics";
                // 文件保存路径
                String filePath = request.getSession().getServletContext().getRealPath(fileRelativePath);
                File f = new File(filePath);
                //若目录不存在，则创建
                if(!f.exists()){
                    f.mkdirs();
                }
                // 转存文件
                String src_name = file.getOriginalFilename();

                file.transferTo(new File(filePath,src_name));
                fileRelativePath +="/" + src_name;
                fileRelativePath = fileRelativePath.substring(1);

                return fileRelativePath;
                //    System.out.println("头像剪裁后的文件保存相对路径：" + fileRelativePath.replace("_src.","_cut."));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return null;

    }
}
