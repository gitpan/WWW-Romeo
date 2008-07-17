package WWW::Romeo::DB::User::Attribute;

use base qw/DBIx::Class/;

__PACKAGE__->load_components(qw/PK::Auto Core/);
__PACKAGE__->table('user_attribute');
__PACKAGE__->add_columns(
    id      =>      {
        is_auto_increment       =>      1,
        data_type               =>      'integer',
    },
    user    =>      {
        data_type               =>      'integer',
        is_foreign_key          =>      1,
    },
    key     =>      {
        data_type               =>      'string',
        size                    =>      '255',
    },
    value   =>      {
        data_type               =>      'string',
        size                    =>      '2048',
    },
);

__PACKAGE__->set_primary_key('id');
__PACKAGE__->belongs_to(user         =>          'WWW::Romeo::DB::User');
