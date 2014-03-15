module StaticPagesHelper

	def concept_icon
		image_tag("concept72.png", class: "table_icon", alt: "concept icon")
	end

	def negotiate_icon
		image_tag("negotiate72.png", class: "table_icon", alt: "negotiating icon")
	end

	def agreement_icon
		image_tag("agreement72.png", class: "table_icon", alt: "agreement icon")
	end

	def review_icon
		image_tag("regulatory_review72.png", class: "table_icon", alt: "regulatory review icon")
	end

	def formulate_icon
		image_tag("formulation72.png", class: "table_icon", alt: "formulation icon")
	end

	def sample_icon
		image_tag("sampling72.png", class: "table_icon", alt: "sampling icon")
	end

	def register_icon
		image_tag("registration72.png", class: "table_icon", alt: "registration icon")
	end

	def manufacture_icon
		image_tag("production72.png", class: "table_icon", alt: "production icon")
	end

	def logistics_icon
		image_tag("logistics72.png", class: "table_icon", alt: "logistics icon")
	end

	def design_icon
		image_tag("design72.png", class: "table_icon", alt: "design icon")
	end

	def print_icon
		image_tag("printing72.png", class: "table_icon", alt: "print icon")
	end

	def procure_icon
		image_tag("ingredients72.png", class: "table_icon", alt: "procure icon")
	end

	def purchaseorder_icon
		image_tag("purchaseorder72.png", class: "table_icon", alt: "purchase order icon")
	end

	def sample_contract_pic
		image_tag("sample_contract.png", class: "oversize_png", alt: "sample contract picture")
	end

	def demo_age_pic
		image_tag("demo_age.jpg", class: "oversize_png", alt: "demo age picture")
	end

	def symbolize_keys_deep!(h)
    h.keys.each do |k|
        ks    = k.respond_to?(:to_sym) ? k.to_sym : k
        h[ks] = h.delete k # Preserve order even when k == ks
        symbolize_keys_deep! h[ks] if h[ks].kind_of? Hash
    end
	end

	# This symbolizes even hashes inside an array.
	def recursive_symbolize_keys!
    symbolize_keys!
    # symbolize each hash in .values
    values.each{|h| h.recursive_symbolize_keys! if h.is_a?(Hash) }
    # symbolize each hash inside an array in .values
    values.select{|v| v.is_a?(Array) }.flatten.each{|h| h.recursive_symbolize_keys! if h.is_a?(Hash) }
    self
  end

	def product_name
		@alldonet_product_list.each do |product|
			product[0..@product_list_count]['pn']
		end
	end
end