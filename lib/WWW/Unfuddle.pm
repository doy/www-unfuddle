package WWW::Unfuddle;
use Moose;
use LWP::UserAgent;
use JSON;

use WWW::Unfuddle::Project;

has username => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

has password => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

has subdomain => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

has ua => (
    is       => 'ro',
    isa      => 'LWP::UserAgent',
    lazy     => 1,
    default  => sub {
        my $self = shift;
        my $ua = LWP::UserAgent->new;
        $ua->credentials($self->_domain . ':80', 'Unfuddle API',
                         $self->username, $self->password);
        return $ua;
    },
);

sub _domain {
    my $self = shift;
    return $self->subdomain . '.unfuddle.com';
}

sub _api_url {
    my $self = shift;
    my @path = @_;
    return 'http://' . $self->_domain . '/api/v1/' . join('/', @path) . '.json';
}

sub request {
    my $self = shift;
    my ($method, @path) = @_;
    my $req = HTTP::Request->new($method => $self->_api_url(@path));
    $req->header(Accept => 'application/json');
    my $resp = $self->ua->request($req);
    if ($resp->code != 200) {
        confess sprintf 'Error (%d): %s', $resp->code, $resp->content;
    }
    return from_json($resp->content);
}

sub get {
    my $self = shift;
    $self->request(GET => @_);
}

sub projects {
    my $self = shift;
    return map { WWW::Unfuddle::Project->new($_) } @{ $self->get('projects') };

}

__PACKAGE__->meta->make_immutable;
no Moose;

1;
