package test;

import java.util.Scanner;

import ficha1.Ficha1;

public class Ficha1Test {
  public static void main(String[] args) {
    Ficha1 f = new Ficha1();
    Scanner sc = new Scanner(System.in);

    System.out.println("Insira graus:");
    double graus = sc.nextDouble();
    double fares = f.celsiusParaFarenheit(graus);
    System.out.println("Celsius:" + " " + graus + "\n" + "Farenheit:" + " " + fares);

    System.out.println("Insira dois inteiros:");
    double i1 = sc.nextInt();
    double i2 = sc.nextInt();
    String ord = i1 > i2 ? i2 + " " + i1 : i1 + " " + i2;
    System.out.println(ord);
    System.out.println("Média:" + " " + (i1+i2) / 2);

    long res = f.factorial(Integer.parseInt(args[0]));

    System.out.println("O factorial de " + args[0] + " é " + res);
  }
}
