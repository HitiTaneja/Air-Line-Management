package hibernate.modal;

public class Concession 
{
	private String category;
	private int discount;
	
	public Concession(String category, int discount) 
	{
		this.category = category;
		this.discount = discount;
	}
	public Concession() 
	{}
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
}
