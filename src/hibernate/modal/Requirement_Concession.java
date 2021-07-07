package hibernate.modal;

public class Requirement_Concession
{
	private String category;
	private int price;
	public Requirement_Concession(String category, int price) {
		super();
		this.category = category;
		this.price = price;
	}
	public Requirement_Concession() {
		super();
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}
