package dto;

import java.io.Serializable;

public class Product implements Serializable{
	
	private static final long serialVersionUID = -4274700572038677000L;
	private String productSubId;
	private String productId;
	private String pname;
	private Integer unitPrice;
	private String description;
	private String manufacturer;
	private String category;
	private long unitsInStock;
	private String condition;
	private String filename;
	private int quantity;
	
	public Product() {
		super();
	}
	
	public Product(String productId, String pname, Integer unitPrice) {
		this.productId = productId;
		this.pname = pname;
		this.unitPrice = unitPrice;
	}
	
	public void setProductSubId(String productSubId) {
		this.productSubId = productSubId;
	}
	
	public String getProductSubId() {
		return productSubId;
	}
	
	public void setPname(String pname) {
		this.pname = pname;
	}
	
	public String getPname() {
		return pname;
	}
	
	public void setProductId(String productId) {
		this.productId = productId;
	}
	
	public String getProductId() {
		return productId;
	}
	
	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}
	
	public Integer getUnitPrice() {
		return unitPrice;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	
	public String getManufacturer() {
		return manufacturer;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getCategory() {
		return category;
	}
	
	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}
	
	public long getUnitsInStock() {
		return unitsInStock;
	}
	
	public void setCondition(String condition) {
		this.condition = condition;
	}
	
	public String getCondition() {
		return condition;
	}
	
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	public String getFilename() {
		return filename;
	}
	
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public int getQuantity() {
		return quantity;
	}
}
