using System;

public class Class1
{
	public Class1()
	{
		//int year, month;
		(year, month) = (year + month / 12, month % 12 + 1);
        Console.WriteLine($"year left: {year} / {month}");
    }
}
