function nansum_mod=nansum_afa(a)

if all(isnan(a))
    nansum_mod=nan;
else
    nansum_mod=nansum(a);
end