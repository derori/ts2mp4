package init;

use 5.20.1;
use FindBin;
use lib "$FindBin::Bin/../lib";

$ENV{"PROJECT_ROOT"} = "$FindBin::Bin/../";

1;
