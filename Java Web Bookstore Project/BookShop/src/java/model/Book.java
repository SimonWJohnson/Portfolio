package model;

import java.text.DecimalFormat;
import java.io.*;

public class Book implements Serializable{

  String isbn="";
  String title="";
  String author = "";
  double price = 0.00;

  public String getIsbn() {
    return isbn;
  }
  public String getTitle() {
    return title;
  }
  public String getAuthor() {
    return author;
  }
  public double getPrice() {
    return price;
  }

  public String toString() {
    return("Title: " +  title + "  ");
  }

  public String getDollarPrice() {
    DecimalFormat price = new DecimalFormat("0.00");
    return ("$" + price.format (this.price));
  }

  public Book(String isbn, String title, String author, double price) {
  this.isbn = isbn; this.author= author; this.title = title;
  this.price = price;
  }
} 