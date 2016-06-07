package com.blog.controller;

import com.blog.services.BlogService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);


    private BlogService blogService;

    @Autowired
    public HomeController(BlogService blogService) {
        this.blogService = blogService;
    }


    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public String homePage(Model model) {
        model.addAttribute("articlesList", blogService.getAllArticles());
        return "index";
    }
}