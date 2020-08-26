package e_sale;

public class E_saleDTO {

	private String e_car_num;
	private String name;
	private String e_mail;
	private String e_mailHash;
	public String getE_mailHash() {
		return e_mailHash;
	}
	

	private boolean e_mailcheck;
	
	
	public String getE_car_num() {
		return e_car_num;
	}
	public void setE_car_num(String e_car_num) {
		this.e_car_num = e_car_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getE_mail() {
		return e_mail;
	}
	public void setE_mail(String e_mail) {
		this.e_mail = e_mail;
	}
	public boolean isE_mailcheck() {
		return e_mailcheck;
	}
	public void setE_mailcheck(boolean e_mailcheck) {
		this.e_mailcheck = e_mailcheck;
	}
	public void setE_mailHash(String e_mailHash) {
		this.e_mailHash = e_mailHash;
	}
	
	public E_saleDTO() {
		
	}
	
	public E_saleDTO(String e_car_num, String name, String e_mail,String e_mailHash ,boolean e_mailcheck) {
		super();
		this.e_car_num = e_car_num;
		this.name = name;
		this.e_mail = e_mail;
		this.e_mailHash = e_mailHash;
		this.e_mailcheck = e_mailcheck;
		
		
	}
}
