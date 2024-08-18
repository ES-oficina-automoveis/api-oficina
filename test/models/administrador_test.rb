require "test_helper"

class AdministradorTest < ActiveSupport::TestCase
  setup do
    @admin = administradors(:one)
  end

  test "valid administrador" do
    assert @admin.valid?
  end

  test "invalid without email" do
    @admin.email = nil
    assert_not @admin.valid?, "Administrador is valid without an email"
    assert_not_nil @admin.errors[:email], "no validation error for email present"
  end

  test "email must be unique" do
    duplicate_admin = @admin.dup
    duplicate_admin.email = @admin.email.upcase
    @admin.save
    assert_not duplicate_admin.valid?, "Administrador is valid with duplicate email"
  end

  test "invalid without password" do
    @admin.senha = nil
    assert_not @admin.valid?, "Administrador is valid without a password"
    assert_not_nil @admin.errors[:senha], "no validation error for senha present"
  end

  test "password must have at least 6 characters" do
    @admin.senha = "12345"
    assert_not @admin.valid?, "Administrador is valid with a short password"
    assert_not_nil @admin.errors[:senha], "no validation error for short senha"
  end
end