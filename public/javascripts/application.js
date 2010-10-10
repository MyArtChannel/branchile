var BRANCHILE = {}

BRANCHILE.showMore = function(branch) {
  $('branch_' + branch).down("a.more").hide();
  $('branch_' + branch).select(".collapsed").each(function(n) {
    n.blindDown({duration: 0.5, afterFinish: function() { $('branch_' + branch).down("a.less").show(); } });
  });
}
BRANCHILE.showLess = function(branch) {
  $('branch_' + branch).down("a.less").hide();
  $('branch_' + branch).select(".collapsed").each(function(n) {
    n.blindUp({duration: 0.5, afterFinish: function() { $('branch_' + branch).down("a.more").show(); } });
  });
}