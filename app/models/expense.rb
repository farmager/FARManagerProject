class Expense < ActiveRecord::Base
  
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :year, presence:true
  before_save :update_income
  before_save :update_expenses
   before_save :update_taxable
   before_save :fed_tax_money_owed
  before_save :prov_tax_money_owed
  before_save :tax_owed
  
 after_initialize :initvaluesifzero

    def initvaluesifzero
      self.subscription_costs  ||= 0           
      self.pulse  ||= 0
      self.cereals  ||= 0
      self.canola  ||= 0
      self.flax  ||= 0
      self.office_expenses  ||= 0
      self.accounting_legalfees  ||= 0
      self.property_taxes  ||= 0
      self.rents  ||= 0
      self.vehicle_expenses  ||= 0
      self.hardware_costs  ||= 0 
      self.telephone  ||= 0
      self.fertilizer  ||= 0 
      self.chemicals  ||= 0
      self.insurancepremium  ||= 0
      self.machinery_fuel ||=0
      self.electricity  ||= 0
      self.trucking  ||= 0
      self.heating_fuel ||=0
      self.machinery_repairs  ||= 0
      self.building_repairs  ||= 0
      self.machinery_rent ||=0
      self.interest  ||= 0
      
      
    end
  def update_income
   
   gross_income=pulse+cereals+canola+flax
   
  end
  
  def update_expenses
    total_expenses=subscription_costs+office_expenses+accounting_legalfees+property_taxes+rents+vehicle_expenses+hardware_costs+telephone+fertilizer+chemicals+insurancepremium+machinery_fuel+electricity+trucking+heating_fuel+machinery_repairs+building_repairs+machinery_rent+interest
  
  end
  
   def update_taxable
update_income-update_expenses
  end
  
  # http://www.cra-arc.gc.ca/E/pbg/tf/t2042/t2042-12e.pdf
  
# 15% on the first $43,953 of taxable income, +
# 22% on the next $43,954 of taxable income (on the portion of taxable income over $43,953 up to $87,907), +
# 26% on the next $48,363 of taxable income (on the portion of taxable income over $87,907 up to $136,270), +
# 29% of taxable income over $136,270.
#loss 
  def fed_tax_money_owed
    if update_taxable <= 43953 && update_taxable >= 11038
      ((update_taxable-11038) * 0.15)
    elsif update_taxable >= 43953.01 && update_taxable <=87907
      ((update_taxable-43953)*0.22+(4937.25))
    elsif update_taxable >= 87907.01 && update_taxable <=136270
      ((update_taxable-87907)*0.26+(14607.13))
    elsif update_taxable >= 136270.01
      ((update_taxable-136270)*0.29+(27181.51))
    elsif update_taxable <= 11038 && update_taxable > 0
      0
      else update_taxable < 0
      update_taxable
    end
  end

  def prov_tax_money_owed
    if update_taxable <= 43292 && update_taxable >= 15241
      ((update_taxable-15241) * 0.11)
    elsif update_taxable >= 43292.01  && update_taxable <=123692
      ((update_taxable-43292)*0.13+(3085.11))
    elsif update_taxable >= 123692.01
      ((update_taxable-123692)*0.15+(13537.11))
    elsif update_taxable <= 15241 && update_taxable > 0
      0
      else update_taxable < 0
      update_taxable
    end
  end

  def tax_owed
    if update_taxable >= 0
    fed_tax_money_owed+prov_tax_money_owed
    else
      update_taxable
      end
  end
 

end
