package org.project.controller;

import org.project.vo.CorporationVO;
import org.project.vo.FileVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@Controller
public class FileDownloadController {

    @RequestMapping(value = "/fileDownload")
    public void fileDownload(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
        //String path =  request.getSession().getServletContext().getRealPath("저장경로");
        System.out.println("--------------------------------------------------------------request : " );

        String fileName =request.getParameter("fileName");
        String realFilename="";
        System.out.println("--------------------------------------------------------------fileName : " + fileName.toString());

        try {
            String browser = request.getHeader("User-Agent");
            //파일 인코딩
            if (browser.contains("MSIE") || browser.contains("Trident")
                    || browser.contains("Chrome")) {
                fileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+",
                        "%20");
                System.out.println("--------------------------------------------------------------if : " + fileName.toString());
            } else {
                fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
                System.out.println("--------------------------------------------------------------else : " + fileName);
            }
        } catch (UnsupportedEncodingException ex) {
            System.out.println("UnsupportedEncodingException");
            System.out.println("--------------------------------------------------------------catch : " + fileName);
        }
        realFilename = "C:\\dev\\Project\\src\\main\\resources\\upload\\" + fileName;
        System.out.println(realFilename);
        File file1 = new File(realFilename);
        if (!file1.exists()) {
            return ;
        }

        // 파일명 지정
        response.setContentType("application/octer-stream");
        response.setHeader("Content-Transfer-Encoding", "binary;");
        response.setHeader("Content-Disposition", "attachment; fileName=\"" + fileName + "\"");
        try {
            OutputStream os = response.getOutputStream();
            FileInputStream fis = new FileInputStream(realFilename);

            int ncount = 0;
            byte[] bytes = new byte[512];

            while ((ncount = fis.read(bytes)) != -1 ) {
                os.write(bytes, 0, ncount);
            }
            fis.close();
            os.close();
        } catch (Exception e) {
            System.out.println("FileNotFoundException : " + e);
        }
    }

}
