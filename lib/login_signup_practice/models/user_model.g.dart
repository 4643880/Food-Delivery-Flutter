// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[0] as int?,
      username: fields[1] as String?,
      nicename: fields[2] as String?,
      email: fields[3] as String?,
      url: fields[4] as String?,
      registered: fields[5] as DateTime?,
      displayname: fields[6] as String?,
      firstname: fields[7] as String?,
      lastname: fields[8] as String?,
      nickname: fields[9] as String?,
      description: fields[10] as String?,
      role: (fields[11] as List?)?.cast<String>(),
      shipping: fields[12] as dynamic,
      billing: fields[13] as Billing?,
      avatar: fields[14] as String?,
      woocommerceRewardPoints: fields[15] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.nicename)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.registered)
      ..writeByte(6)
      ..write(obj.displayname)
      ..writeByte(7)
      ..write(obj.firstname)
      ..writeByte(8)
      ..write(obj.lastname)
      ..writeByte(9)
      ..write(obj.nickname)
      ..writeByte(10)
      ..write(obj.description)
      ..writeByte(11)
      ..write(obj.role)
      ..writeByte(12)
      ..write(obj.shipping)
      ..writeByte(13)
      ..write(obj.billing)
      ..writeByte(14)
      ..write(obj.avatar)
      ..writeByte(15)
      ..write(obj.woocommerceRewardPoints);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BillingAdapter extends TypeAdapter<Billing> {
  @override
  final int typeId = 1;

  @override
  Billing read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Billing(
      firstName: fields[0] as String?,
      lastName: fields[1] as String?,
      company: fields[2] as String?,
      address1: fields[3] as String?,
      address2: fields[4] as String?,
      city: fields[5] as String?,
      state: fields[6] as String?,
      postcode: fields[7] as String?,
      country: fields[8] as String?,
      email: fields[9] as String?,
      phone: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Billing obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.company)
      ..writeByte(3)
      ..write(obj.address1)
      ..writeByte(4)
      ..write(obj.address2)
      ..writeByte(5)
      ..write(obj.city)
      ..writeByte(6)
      ..write(obj.state)
      ..writeByte(7)
      ..write(obj.postcode)
      ..writeByte(8)
      ..write(obj.country)
      ..writeByte(9)
      ..write(obj.email)
      ..writeByte(10)
      ..write(obj.phone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BillingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
