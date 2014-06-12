package cs350_maze;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.Scanner;

public class DataBaseHandler {

	private String _dataBaseName;
	private Scanner _in;
	
	public DataBaseHandler(String dbName)
	{
		_dataBaseName = dbName;
	}
	
	public void openConnection()
	{
		try {
			_in = new Scanner(new FileReader(_dataBaseName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public void closeConnection()
	{
		_in.close();
	}
	
	public String pullQuestion()
	{
		return _in.nextLine();
	}
	
	public String pullCategory()
	{
		return _in.nextLine();
	}
	
	public String pullAnswers()
	{
		return _in.nextLine();
	}
	
	public String toString()
	{
		return _dataBaseName;
	}

	public void initDB() {
		// TODO Auto-generated method stub
		
	}

	public String pullScores() {
		// TODO Auto-generated method stub
		return null;
	}
}
