package com.blog.controller;

import com.blog.model.Articles;
import com.blog.services.BlogService;
import org.joda.time.LocalDate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import java.sql.Date;
import java.util.Map;

@Controller
public class AddArticleController {

    private static final Logger logger = LoggerFactory.getLogger(AddArticleController.class);

    @Autowired
    private BlogService blogService;

    @InitBinder
    public void setAllowedFields(WebDataBinder dataBinder) {
        dataBinder.setDisallowedFields("id");
    }

    @RequestMapping(value = "/addarticle", method = RequestMethod.GET)
    public String initCreationUser(Map<String, Object> model) {
        Articles articles = new Articles();

        model.put("articles", articles);

        return "addarticle";
    }

    @RequestMapping(value = "/article/add", method = RequestMethod.POST)
    public String processCreationUser(@Valid Articles articles, BindingResult result) {

//        Automatically set date when created article

        LocalDate localDate = new LocalDate();

        Date date = Date.valueOf(String.valueOf(localDate));

        articles.setDate(date);

        if (result.hasErrors()) {
            return "addarticle";
        } else {
            blogService.saveArticle(articles);

            return "redirect:/index";
        }
    }
}


