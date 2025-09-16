class Collections::Create
  def initialize(attrs)
    attrs['created_at'] = Time.now
    attrs['updated_at'] = Time.now

    attrs.slice!(*%w[name parameters created_at updated_at])

    @attrs = attrs
  end

  def call
    employer = Collection.new(**@attrs)

    employer.save

    employer
  end
end
