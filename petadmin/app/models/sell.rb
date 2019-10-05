# frozen_string_literal: true

class Sell < ApplicationRecord
  include Fae::BaseModelConcern
  enum status: { finalizada: 0, cancelada: 1 }
  validates :client, presence: true

  belongs_to :discount
  belongs_to :client

  has_many :sell_products
  has_many :products, through: :sell_products, dependent: :destroy

  has_many :sell_services
  has_many :services, through: :sell_services, dependent: :destroy

  before_save :set_total

  def fae_display_field
    id
  end

  def self.for_fae_index
    order(:id)
  end

  private

  def set_total
    total = 0
    products.each { |p| total += p.price }
    services.each { |s| total += s.price }

    total -= discount.value if discount.present?

    total = total.postivie? ? total : 0
    total = total
  end
end
