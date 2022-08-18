
class Bill
    attr_accessor :no_of_items, :price, :item, :tax, :total_tax, :total_price
    @@total_price=0
    @@total_tax=0
    def initialize(a)
        @no_of_items=a[0].to_i
        @price=a[-1].to_f
        s=""
        for i in 1...a.size-2
            s=s+a[i]+" "
        end
        @item=s
        @tax=0
    end
    
    def tax_cal
        if @item.include?"imported"
            @tax+=0.05
        end

        if @item.include? "pills" or @item.include? "chocolate" or @item.include? "book"
            @tax+=0
        else
            @tax+=0.10  
        end

        @tax*=@price
        @tax*=@no_of_items
        @tax=@tax.round(2)
    end
    
    def price_cal
        @price*=@no_of_items
        @price=@price+tax
        @price=@price.round(2)
    end
    
    def final_cal
        @@total_price += @price
        @@total_tax += @tax
    end
    
    def outp
        puts "#{@no_of_items} #{@item}: #{@price}"
    end
    
    def self.final_outp
        
        puts "sales tax: #{@@total_tax}"
         @@total_tax=@@total_tax.round(2)
        puts "Total: #{@@total_price}"
    end
    
end   

n=gets.chomp.to_i
arr=[]

n.times do |i|
    a=gets.chomp.split(" ")
    arr.push(Bill.new(a))
    arr[i].tax_cal
    arr[i].price_cal
    arr[i].final_cal
end
puts "/n OUTPUT:/n"
arr.each do|x|
    x.outp
end

Bill.final_outp

