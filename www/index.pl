use strict;
use warnings;

use Data::Dumper;
use feature 'say';

my ($q) = @ARGV;

print $q->header('text/html', '200 OK');

my $t = time;

print qq{
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8"/>
		<title>Perl-FPM</title>
		<link rel="stylesheet" href="/style.css" type="text/css">
	</head>
	<body>
		<h1>Perl-FPM Test Page</h1>
		<form action="/?foo=bar" method="post">
			<p><input name="field" value="$t"/>
			<p><input type="submit"/>
		</form>
		<pre>
};

my @names = $q->param;

print "PID $$\n";

foreach ($q->param) {
	print $_, "\t", scalar $q->param($_), "\n";
}

say Dumper \%ENV;

print q{
		</pre>
	</body>
</html>
};
